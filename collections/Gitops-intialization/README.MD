# Introduction

This folder contains terraform template scripts for creating Key-vault, Stroage account and Linux VMSS and pool on Azure environment


Requirements:

- Azure Key Vault with password secret for VMSS user
- Azure Personal Access Token with permission to create Agent Pool on Project level

## Getting Started

Before running terraform scripts, file `terraform.tfvars` and `backend.tf` must be filled by specific Azure project values.
Values can be found in Microsoft Azure Portal: [Azure Portal](https://portal.azure.com/#home).
Values exist on project level or resource group level.


