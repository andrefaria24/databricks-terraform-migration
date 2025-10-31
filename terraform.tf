terraform {
  required_version = ">=1.13.0"

  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.96.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.19.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.51.0"
    }
  }
}