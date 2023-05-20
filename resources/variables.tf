variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}
variable "location" {
  type        = string
  description = "Resources location in Azure"
}

variable "adf_dev_name" {
  type        = string
  description = "Name of azure data factory dev"
}
variable "adf_staging_name" {
  type        = string
  description = "Name of azure data factory staging"
}
variable "adf_prod_name" {
  type        = string
  description = "Name of azure data factory prod"
}

variable "storage_account_name1" {
  type        = string
  description = "Name of first azure storage account"
}
variable "storage_account_name2" {
  type        = string
  description = "Name of second azure storage account"

}