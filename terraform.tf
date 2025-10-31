terraform {
  required_version = ">=1.13.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.19.0"
    }

    databricks = {
      source  = "databricks/databricks"
      version = "1.96.0"
    }
  }
}