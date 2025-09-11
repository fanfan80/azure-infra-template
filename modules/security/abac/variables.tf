variable "scope" {
  description = "The scope at which the role assignment applies (e.g., resource group, subscription, etc.)"
  type        = string
}

variable "roleDefinitionName" {
  description = "The name of the built-in or custom role definition"
  type        = string
}

variable "principalId" {
  description = "The Azure AD object ID of the principal (user, group, or service principal)"
  type        = string
}

variable "condition" {
  description = "The condition for attribute-based access control (ABAC)"
  type        = string
}

variable "conditionVersion" {
  description = "The version of the ABAC condition syntax"
  type        = string
  default     = "2.0"
}
