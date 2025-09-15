// variables.tf for data governance policy module
variable "assignment_name" {
	description = "Name of the policy assignment"
	type        = string
}

variable "scope" {
	description = "Scope for the policy assignment (e.g., subscription, resource group)"
	type        = string
}

variable "policy_definition_id" {
	description = "ID of the policy definition to assign"
	type        = string
}
