terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}




provider "azurerm" {
  features {}


  subscription_id             = "7c03dd83-6b95-43b1-9f53-23dfd07e8803"
  client_id                   = "bc33c0bc-9ff9-4127-9858-06b8989b8f63"
  client_secret               = "59g.I3h~1TTy_J~kicJwm2MSMY-20dU_83"
  tenant_id                   = "eb70b763-b6d7-4486-8555-8831709a784e"
}