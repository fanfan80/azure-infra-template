// variables.tf for data backup policy module
// Input variables for data backup policies

variable "vault_name" {
	description = "Name of the Recovery Services Vault"
	type        = string
}

variable "location" {
	description = "Azure region for resources"
	type        = string
}

variable "resource_group_name" {
	description = "Resource group name"
	type        = string
}

variable "tags" {
	description = "Tags for resources"
	type        = map(string)
	default     = {}
}

variable "policy_name" {
	description = "Name of the backup policy"
	type        = string
}
