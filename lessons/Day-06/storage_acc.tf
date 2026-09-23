

resource "azurerm_storage_account" "example" {
 
  name                     = "techtutorial101"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location # implicit dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {

  env = local.common_tags.stage # Using the local variable to set the tag value

  }

}

