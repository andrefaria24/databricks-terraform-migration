variable "databricks_host" {
  type    = string
  default = "https://accounts.cloud.databricks.com"
}

variable "databricks_account_id" {
  type      = string
  sensitive = true
}

variable "databricks_client_id" {
  type      = string
  sensitive = true
}

variable "databricks_client_secret" {
  type      = string
  sensitive = true
}

variable "databricks_aws_role_arn" {
  type      = string
  sensitive = true
}

variable "databricks_aws_root_bucket" {
  type      = string
  sensitive = true
}

variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "aws_vpc_id" {
  type = string
}

variable "aws_subnets" {
  type = set(string)
}

variable "aws_sg" {
  type = set(string)
}

variable "azure_client_id" {
  type      = string
  sensitive = true
}

variable "azure_client_secret" {
  type      = string
  sensitive = true
}

variable "azure_tenant_id" {
  type      = string
  sensitive = true
}

variable "azure_subscription_id" {
  type      = string
  sensitive = true
}

variable "azure_region" {
  type    = string
  default = "East US"
}