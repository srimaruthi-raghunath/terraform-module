#!/usr/bin/env python3

from azure.devops.connection import Connection
from azure.devops.v6_0.service_endpoint.service_endpoint_client import ServiceEndpointClient
from azure.devops.v5_1.task_agent.models import TaskAgentQueue
from azure.devops.v5_1.task_agent.task_agent_client import TaskAgentClient
from msrest.authentication import BasicAuthentication

import requests
from requests.auth import HTTPBasicAuth
import sys
import os
import json

def load_vars_from_envs():
    vars = {}
    vars['personal_access_token'] = os.environ.get("AZDO_PERSONAL_ACCESS_TOKEN")

    vars['subscription_id'] = os.environ.get("SUBSCRIPTION_ID")
    vars['organization'] = os.environ.get("ORGANIZATION")
    vars['project_id'] = os.environ.get("PROJECT_ID")
    vars['resource_group_name'] = os.environ.get("RESOURCE_GROUP_NAME")

    vars['agent_pool_name'] = os.environ.get("AGENT_POOL_NAME")
    vars['service_connection_name'] = os.environ.get("SERVICE_CONNECTION_NAME")
    vars['scaleset_name'] = os.environ.get("SCALESET_NAME")

    vars['max_number_of_vms'] = os.environ.get("MAX_NUMBER_OF_VMS")
    vars['number_of_standby_agents'] = os.environ.get("NUMBER_OF_STANDBY_AGENTS")
    vars['automatically_teardown_vms'] = os.environ.get("AUTOMATICALLY_TEARDOWN_VMS")
    vars['delay_in_minutes'] = os.environ.get("DELAY_IN_MINUTES")
    vars['os_type'] = os.environ.get("OS_TYPE")

    return vars

class AzureDevOpsApiClients:
    def __init__(self, org_name, personal_access_token):       
        organization_url = 'https://dev.azure.com/{}'.format(org_name)
        credentials = BasicAuthentication('', personal_access_token)
        connection = Connection(base_url=organization_url, creds=credentials)
        self.core = connection.clients.get_core_client()
        self.service_connection = ServiceEndpointClient(base_url=organization_url,creds=credentials)
        self.service_connection = ServiceEndpointClient(base_url=organization_url, creds=credentials)
        self.agent_queue = TaskAgentClient(base_url=organization_url, creds=credentials)

def get_service_connection_id(service_connection_name, project_id, clients):
    service_connection_response = clients.service_connection.get_service_endpoints(project=project_id)
    for service_connection in service_connection_response:
        if service_connection_name == service_connection.name:
            return service_connection.id
    return False

def create_vmss_pool(org_name, project_id, service_connection_id, personal_access_token,
                    subscription_id,
                    resource_group_name,
                    scaleset_name,
                    pool_name,
                    max_no_of_vms,
                    no_of_standby_agents,
                    automatically_teardown_vms,
                    delay_in_minutes,
                    os_type):
    headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json'
    }
    request_body = {
        "serviceEndpointId": service_connection_id,
        "serviceEndpointScope": project_id,
        "azureId": "/subscriptions/{}/resourceGroups/{}/providers/Microsoft.Compute/virtualMachineScaleSets/{}".format(subscription_id, resource_group_name, scaleset_name),
        "maxCapacity": max_no_of_vms,
        "desiredIdle": no_of_standby_agents,
        "recycleAfterEachUse": automatically_teardown_vms,
        "timeToLiveMinutes": delay_in_minutes,
        "osType": os_type,
        "state": "new",
        "offlineSince": None,
        "agentInteractiveUI": True,
    }
    request_url = f'https://dev.azure.com/{org_name}/_apis/distributedtask/elasticpools?poolName={pool_name}&api-version=7.1-preview.1'
    response = requests.post(url=request_url, headers=headers, auth=HTTPBasicAuth('', personal_access_token), data=json.dumps(request_body))
    return(response)

def update_vmss_pool(pool_id,org_name, project_id, service_connection_id, personal_access_token,
                    subscription_id,
                    resource_group_name,
                    scaleset_name,
                    max_no_of_vms,
                    no_of_standby_agents,
                    automatically_teardown_vms,
                    delay_in_minutes,
                    os_type):
    headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json'
    }
    request_body = {
        "serviceEndpointId": service_connection_id,
        "serviceEndpointScope": project_id,
        "azureId": "/subscriptions/{}/resourceGroups/{}/providers/Microsoft.Compute/virtualMachineScaleSets/{}".format(subscription_id, resource_group_name, scaleset_name),
        "maxCapacity": max_no_of_vms,
        "desiredIdle": no_of_standby_agents,
        "recycleAfterEachUse": automatically_teardown_vms,
        "timeToLiveMinutes": delay_in_minutes,
        "osType": os_type,
        "agentInteractiveUI": True,
    }
    request_url = f'https://dev.azure.com/{org_name}/_apis/distributedtask/elasticpools/{pool_id}?api-version=7.1-preview.1'
    response = requests.patch(url=request_url, headers=headers, auth=HTTPBasicAuth('', personal_access_token), data=json.dumps(request_body))
    return(response)

def delete_vmss_pool(org_name, personal_access_token, pool_id):
    headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json'
    }
    request_url = f'https://dev.azure.com/{org_name}/_apis/distributedtask/pools/{pool_id}?api-version=7.1-preview.1'

    response = requests.delete(url=request_url, headers=headers, auth=HTTPBasicAuth('', personal_access_token))

    return(response)


def get_vmss_pool(org_name, personal_access_token, pool_id):
    headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json'
    }
    request_url = f'https://dev.azure.com/{org_name}/_apis/distributedtask/elasticpools/{pool_id}?api-version=7.1-preview.1'

    response = requests.get(url=request_url, headers=headers, auth=HTTPBasicAuth('', personal_access_token))

    return(response)

# ------------ terraform commands ------------

def create():
    variable = load_vars_from_envs()

    personal_access_token = variable['personal_access_token']
    organization_name = variable['organization']
    service_connection_name = variable['service_connection_name']
    project_id = variable['project_id']

    clients = AzureDevOpsApiClients(organization_name, personal_access_token)

    if project_id:
        service_connection_id = get_service_connection_id(service_connection_name, project_id, clients)
        if service_connection_id:
            create_pool_response = create_vmss_pool(organization_name, project_id, service_connection_id, personal_access_token,
                            subscription_id = variable['subscription_id'],
                            resource_group_name = variable['resource_group_name'],
                            scaleset_name = variable['scaleset_name'],
                            pool_name = variable['agent_pool_name'],
                            max_no_of_vms = variable['max_number_of_vms'],
                            no_of_standby_agents = variable['number_of_standby_agents'],
                            automatically_teardown_vms = variable['automatically_teardown_vms'],
                            delay_in_minutes = variable['delay_in_minutes'],
                            os_type = variable['os_type']
            )

            if create_pool_response.status_code == 200:
                pool_id = create_pool_response.json()['elasticPool']['poolId']

                get_response = get_vmss_pool(organization_name, personal_access_token, pool_id)
                output = get_response.json()
                output.pop('offlineSince', None)
                output.pop('state', None)
                output.pop('sizingAttempts', None)
                output.pop('desiredSize', None)

                sys.stdout.write(json.dumps(output, sort_keys=True))
            else:
                sys.exit(create_pool_response.json()['message'])
        else:
            sys.exit("Service connection does not exist or you dont have enough access.")
    else:
        sys.exit("Project does not exist or you dont have enough access.")

def update():
    variable = load_vars_from_envs()

    previous_output = json.loads(sys.stdin.read())
    personal_access_token = variable['personal_access_token']
    organization_name = variable['organization']
    project_id = variable['project_id']

    clients = AzureDevOpsApiClients(organization_name, personal_access_token)

    if project_id:
        service_connection_id = get_service_connection_id(variable['service_connection_name'], project_id, clients)
        if service_connection_id:
            update_pool_response = update_vmss_pool(
                            pool_id = previous_output['poolId'],
                            org_name = organization_name,
                            project_id = project_id,
                            service_connection_id = service_connection_id,
                            personal_access_token = personal_access_token,
                            subscription_id = variable['subscription_id'],
                            resource_group_name = variable['resource_group_name'],
                            scaleset_name = variable['scaleset_name'],
                            max_no_of_vms = variable['max_number_of_vms'],
                            no_of_standby_agents = variable['number_of_standby_agents'],
                            automatically_teardown_vms = variable['automatically_teardown_vms'],
                            delay_in_minutes = variable['delay_in_minutes'],
                            os_type = variable['os_type']
            )
            if update_pool_response.status_code == 200:
                pool_id = update_pool_response.json()['poolId']
                get_response = get_vmss_pool(organization_name, personal_access_token, pool_id)
                output = get_response.json()
                output.pop('offlineSince', None)
                output.pop('state', None)
                output.pop('sizingAttempts', None)
                output.pop('desiredSize', None)
                sys.stdout.write(json.dumps(output, sort_keys=True))
            else:
                sys.exit(update_pool_response.json()['message'])
        else:
            sys.exit("Service connection does not exist or you dont have enough access.")
    else:
        sys.exit("Project does not exist or you dont have enough access.")


def delete():
    variable = load_vars_from_envs()

    previous_output = json.loads(sys.stdin.read())

    personal_access_token = variable['personal_access_token']
    org_name = variable['organization']

    delete_response = delete_vmss_pool(org_name, personal_access_token, previous_output['poolId'])

    if delete_response.status_code != 204:
        sys.exit(delete_response.json()['message'])


def read():
    variable = load_vars_from_envs()

    personal_access_token = variable['personal_access_token']
    org_name = variable['organization']

    previous_output = json.loads(sys.stdin.read())
    get_response = get_vmss_pool(org_name, personal_access_token, previous_output['poolId'])

    output = get_response.json()
    output.pop('offlineSince', None)
    output.pop('state', None)
    output.pop('sizingAttempts', None)
    output.pop('desiredSize', None)

    sys.stdout.write(json.dumps(output, sort_keys=True))

if __name__=='__main__':
    if len(sys.argv) > 1:
        if sys.argv[1]=='create':
            create()
        elif sys.argv[1]=='delete':
            delete()
        elif sys.argv[1]=='read':
            read()
        elif sys.argv[1]=='update':
            update()
