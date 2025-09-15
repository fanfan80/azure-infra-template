// variables.tf for data retention policy module
// Input variables for data retention policies

variable "storage_account_id" {
	description = "The ID of the Azure Storage Account"
	type        = string
}

variable "prefix_match" {
	description = "Prefix to match blobs for retention policy"
	type        = string
}

variable "delete_after_days" {
	description = "Number of days after which blobs are deleted"
	type        = number
}

variable "archive_after_days" {
	description = "Number of days after which blobs are moved to archive tier"
	type        = number
}
