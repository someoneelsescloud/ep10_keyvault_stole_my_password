output "certsecret" {
  value = azurerm_key_vault_secret.certsecret.name
}

output "kvname" {
  value = azurerm_key_vault.keyvault_1.name
}

