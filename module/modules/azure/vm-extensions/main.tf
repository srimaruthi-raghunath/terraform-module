resource "azurerm_virtual_machine_extension" "this" {
  name                 = var.extension_name
  virtual_machine_id   = var.virtual_machine_id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
  {
  "fileUris": ["var.filelocation"],
    "commandToExecute": ""
  }
SETTINGS

}