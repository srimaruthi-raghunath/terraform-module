variable "resource_group_name" {
    description = "(Required) The name of the resource group in which the CosmosDB Account is created. Changing this forces a new resource to be created."
}

variable "location" {
    description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "azurerm_cosmosdb_account_name" {
    description = "(Required) Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created."
}

variable "offer_type" {
    description = "(Required) Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard"
    default = "Standard"
}

variable "kind" {
    description = "(Optional) Specifies the Kind of CosmosDB to create - possible values are GlobalDocumentDB and MongoDB. Defaults to GlobalDocumentDB. Changing this forces a new resource to be created."
    default = "GlobalDocumentDB"
}

variable "consistency_level" {
    description = "(Required) The Consistency Level to use for this CosmosDB Account - can be either BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix."
    default = "Session"
}

variable "enable_automatic_failover" {
    description = "failover"
    default = true
}

variable "enable_multiple_write_locations" {
    description = "(Optional) Enable multi-master support for this Cosmos DB account"
    default = true
}

variable "failover_location" {
    description = "(Required) The failover priority of the region. A failover priority of 0 indicates a write region. The maximum value for a failover priority = (total number of regions - 1). Failover priority values must be unique for each of the regions in which the database account exists. Changing this causes the location to be re-provisioned and cannot be changed for the location with failover priority 0."
}

variable "db_name" {
    description = "(Required) Specifies the name of the Cosmos DB Gremlin Database. Changing this forces a new resource to be created."
}


variable "sql_containers" {
    description = "Conatainers info"
    type = map(object({
        container_name = string
        partition_key  = string
      }))
}
