from azure.devops.connection import Connection
from azure.devops.v6_0.service_endpoint.service_endpoint_client import ServiceEndpointClient
from azure.devops.v5_1.task_agent.models import TaskAgentQueue
from azure.devops.v5_1.task_agent.task_agent_client import TaskAgentClient
from msrest.authentication import BasicAuthentication
from os import getenv
from requests import post
from json import dumps, load
from requests.auth import HTTPBasicAuth
import sys

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

def get_project_id(project_name, clients):
    project_found = False
    continuation_token = None
    while not project_found:
        projects_response = clients.core.get_projects(continuation_token=continuation_token)
        projects = [project for project in projects_response.value]
        for project in projects:
            if project.name == project_name:
                project_id = project.id
                project_found = True
        if not project_found and projects_response.continuation_token != None:
            continuation_token = projects_response.continuation_token
        else:
            break
    if not project_found:
        return False
    else:
        return project_id

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
        "maxSavedNodeCount": 2,
        "osType": os_type,
        "state": "new",
        "offlineSince": None,
        "desiredSize": 1,
        "sizingAttempts": 3,
        "agentInteractiveUI": True,
    }
    request_url = 'https://dev.azure.com/{}/_apis/distributedtask/elasticpools?poolName={}&api-version=7.1-preview.1'\
        .format(org_name, pool_name)
    response = post(url=request_url, headers=headers, auth=HTTPBasicAuth('', personal_access_token), data=dumps(request_body))
    return(response)

def create_queue(clients, pool_id, queue_name, project_id):
    agent_pool = clients.agent_queue.get_agent_pool(pool_id=pool_id)
    queue = TaskAgentQueue(name=queue_name, pool=agent_pool, project_id=project_id)
    try:
        response = clients.agent_queue.add_agent_queue(queue=queue, project=project_id, authorize_pipelines=True)
    except Exception as e:
        return {'status':False, 'response':str(e)}
    return {'status':True, 'response':response}

def main(personal_access_token):
    variable = load(sys.stdin)
    
    organization_name = variable['organization']
    project_name = variable['project_name']
    service_connection_name = variable['service_connection_name']

    clients = AzureDevOpsApiClients(organization_name, personal_access_token)
    
    project_id = get_project_id(project_name, clients)

    if project_id:
        service_connection_id = get_service_connection_id(service_connection_name, project_id, clients)
        if service_connection_id:
            create_pool_response = create_vmss_pool(organization_name, project_id, service_connection_id, personal_access_token,
                            subscription_id = variable['subscription_id'],
                            resource_group_name = variable['resource_group_name'],
                            scaleset_name = variable['scaleset_name'],
                            pool_name = variable['agent_pool_name'],
                            max_no_of_vms = variable['max_no_of_vms'],
                            no_of_standby_agents = variable['no_of_standby_agents'],
                            automatically_teardown_vms = variable['automatically_teardown_vms'],
                            delay_in_minutes = variable['delay_in_minutes'],
                            os_type = variable['os_type']
            )
            if create_pool_response.status_code == 200:
                Pool_ID = create_pool_response.json()['agentPool']['id']
                Pool_Name = create_pool_response.json()['agentPool']['name']
                create_queue_response = create_queue(clients, create_pool_response.json()['agentPool']['id'], variable['agent_pool_name'], project_id)
                if create_queue_response['status']:

                    Queue_ID = create_queue_response['response'].id
                    Queue_Name = create_queue_response['response'].name
                    dict_output = {"Pool ID": str(Pool_ID), "Pool Name": Pool_Name, "Queue ID": str(Queue_ID), "Queue Name": Queue_Name}
                    json_output = dumps(dict_output)
                    print(json_output)

                else:
                    error_msg = create_queue_response['response']
                    sys.exit(error_msg)
            else:
                sys.exit(create_pool_response.text)
        else:
            sys.exit("Service connection does not exist or you dont have enough access.")
    else:
        sys.exit("Project does not exist or you dont have enough access.")

if __name__ == "__main__":
    personal_access_token = getenv('azuredevopspat')
    main(personal_access_token)
