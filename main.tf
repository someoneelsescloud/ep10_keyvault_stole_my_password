########### Locals ###########
locals {
  name_1       = random_pet.name_1.id
  locationid   = random_shuffle.locations.result[0]
  resourcename = "${local.name_1}-${local.locationid}"
}

resource "random_pet" "name_1" {
  length = 1
}

resource "random_password" "password" {
  length           = 20
  special          = true
  override_special = "!$[]%@"
}

resource "random_shuffle" "locations" {
  input        = ["eastus", "westus"]
  result_count = 2
}

########### Management 1  ###########
resource "azurerm_resource_group" "resourcegroup_1" {
  name     = "${local.resourcename}-rg-1"
  location = local.locationid
}

########### KeyVault ###########
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault_1" {
  name                        = "${local.resourcename}-kv-1"
  location                    = azurerm_resource_group.resourcegroup_1.location
  resource_group_name         = azurerm_resource_group.resourcegroup_1.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false

  enabled_for_deployment          = true
  enabled_for_template_deployment = true

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "Backup",
      "Delete",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Set"
    ]

    storage_permissions = [
      "Get",
    ]
  }

}

resource "azurerm_key_vault_secret" "certsecret" {
  name         = "someonessecret"
  value        = random_password.password.result
  key_vault_id = azurerm_key_vault.keyvault_1.id
}