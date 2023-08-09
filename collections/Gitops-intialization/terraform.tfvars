# Deploy in Target Project
#Key-Vault and stoarge account variable vaules
resource_group_name                   = ""
new_keyvault_name                     = ""
key_permissions_spn                   = ["Create", "Get", "List", "Update"]
secret_permissions_spn                = ["Set", "Get", "List"]
certificate_permissions_spn           = ["Get", "List"]
user_obj_id                           = ""
userpermission                        = "true" # required "ture" if you want to add ACL to any user if not please delete this line
storage_account_name                  = ""
storage_account_tier                  = ""
storage_account_name_replication_type = ""
virtual_network_name                  = ""
subnet_name                           = ""
nsg_name                              = ""
container_name                        = ""