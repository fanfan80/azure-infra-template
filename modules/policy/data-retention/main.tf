// main.tf for data retention policy module
// Example: Azure Storage Account Management Policy for Data Retention
// main.tf for data retention policy module
// Example: Azure Storage Account Management Policy for Data Retention
// Already provided above

resource "azurerm_storage_management_policy" "retention_policy" {
	storage_account_id = var.storage_account_id

	rule {
		name    = "delete-old-blobs"
		enabled = true

		filters {
			prefix_match = [var.prefix_match]
			blob_types   = ["blockBlob"]
		}

		actions {
			base_blob {
				delete_after_days_since_modification_greater_than = var.delete_after_days
			}
		}
	}
}
