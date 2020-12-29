data "azurerm_key_vault" "key_vault" {
  name                = "learntf-vault8907"
  resource_group_name = "remote-state"
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "admin-password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}