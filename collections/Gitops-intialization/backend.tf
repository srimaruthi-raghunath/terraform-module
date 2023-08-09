terraform {
  backend "azurerm" {
    # The name of the resource group in which the resources will be created. 
    resource_group_name = ""
    # The name of storage account where terraform state file will be saved.
    storage_account_name = ""
    # The name of container inside storage account
    container_name = ""
    # The name for key to store state file Ex: *dev/project.tfstate* .
    key = "gof.tfstate"
  }
}