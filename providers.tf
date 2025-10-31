provider "aws" {
  region = var.aws_region
  alias  = "acfaria-account" # Change as needed
}

provider "databricks" {
  host          = var.databricks_host
  account_id    = var.databricks_account_id
  client_id     = var.databricks_client_id
  client_secret = var.databricks_client_secret
}