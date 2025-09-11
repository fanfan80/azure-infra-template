variable "resourceGroupName" {
  description = "Name of the resource group for Data Factory"
  type        = string
}

variable "location" {
  description = "Azure region for Data Factory resources"
  type        = string
}

variable "dataFactoryName" {
  description = "Name of the Data Factory instance"
  type        = string
}
