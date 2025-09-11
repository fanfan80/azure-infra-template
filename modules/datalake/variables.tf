variable "resourceGroupName" {
  description = "Name of the resource group for Data Lake"
  type        = string
}

variable "location" {
  description = "Azure region for Data Lake resources"
  type        = string
}

variable "storageAccountName" {
  description = "Name of the Data Lake storage account"
  type        = string
}

variable "containerName" {
  description = "Name of the Data Lake container"
  type        = string
}

variable "containerAccessType" {
  description = "Access type for the Data Lake container"
  type        = string
  default     = "private"
}
