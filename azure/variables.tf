
variable "resource_group_name" {
  type        = string
  default     = "rg-static-site"
}
variable "location" {
  type        = string
  default     = "Central India"
}
variable "storage_account_name" {
  type        = string
  description = "3-24 lower case letters and numbers."
}
