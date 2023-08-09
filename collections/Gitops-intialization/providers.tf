terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.89.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.3.0"
    }
  }
}
provider "azurerm" {
  features {}
}
provider "azuredevops" {
  org_service_url = "https://dev.azure.com/SW4ZF"
}