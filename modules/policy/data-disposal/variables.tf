// variables.tf for data disposal policy module
variable "storage_account_id" {
	description = "The ID of the Azure Storage Account"
	type        = string
}

variable "prefix_match" {
	description = "Prefix to match blobs for disposal policy"
	type        = string
}

variable "delete_after_days" {
	description = "Number of days after which blobs are deleted"
	type        = number
}
