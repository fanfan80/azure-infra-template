// variables.tf for data classification policy module
variable "storage_account_name" {
	description = "Name of the storage account"
	type        = string
}

variable "resource_group_name" {
	description = "Resource group name"
	type        = string
}

variable "location" {
	description = "Azure region for resources"
	type        = string
}

variable "classification" {
	description = "Data classification tag (e.g., public, internal, confidential, restricted)"
	type        = string
}
