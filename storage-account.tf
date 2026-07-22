# # Create an Azure Storage Account
# resource "azurerm_storage_account" "candlestore_sa" {
#   name                     = "candlestoresa01" # Must be globally unique, 3-24 lowercase letters/numbers
#   resource_group_name      = azurerm_resource_group.rg.name
#   location                 = azurerm_resource_group.rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS" # Options: LRS, GRS, RAGRS, ZRS

#   tags = {
#     environment = "dev"
#   }
# }

# # Create a Blob Storage Container inside the Storage Account
# resource "azurerm_storage_container" "candlestore_container" {
#   name                  = "candlestore-blobs"
#   storage_account_name  = azurerm_storage_account.candlestore_sa.name
#   container_access_type = "private" # Options: private, blob, container
# }
