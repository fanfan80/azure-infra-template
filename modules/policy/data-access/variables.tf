// variables.tf for data access policy module
variable "storage_account_id" {
	description = "The ID of the storage account"
	type        = string
}

variable "role_definition_name" {
	description = "Role definition name (e.g., Storage Blob Data Reader)"
	type        = string
}

variable "principal_id" {
	description = "The Azure AD object ID of the principal (user, group, or service principal)"
	type        = string
}
