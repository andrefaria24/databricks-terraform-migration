# cross-account ARN
resource "databricks_mws_credentials" "aws" {
  #provider         = databricks
  credentials_name = "aws_credentials"
  role_arn         = var.databricks_aws_role_arn
}

# register root bucket
resource "databricks_mws_storage_configurations" "aws" {
  #provider                   = databricks
  account_id                 = var.databricks_account_id
  storage_configuration_name = "aws_storage"
  bucket_name                = var.databricks_aws_root_bucket
}

# register VPC
resource "databricks_mws_networks" "aws" {
  #provider           = databricks
  account_id         = var.databricks_account_id
  network_name       = "aws_network"
  vpc_id             = var.aws_vpc_id
  subnet_ids         = var.aws_subnets
  security_group_ids = var.aws_sg
}

# create workspace in given VPC with DBFS on root bucket
resource "databricks_mws_workspaces" "aws" {
  #provider       = databricks
  account_id     = var.databricks_account_id
  workspace_name = "aws_workspace"
  aws_region     = var.aws_region

  credentials_id           = databricks_mws_credentials.aws.credentials_id
  storage_configuration_id = databricks_mws_storage_configurations.aws.storage_configuration_id
  network_id               = databricks_mws_networks.aws.network_id
}