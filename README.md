# Databricks Migration with Terraform (AWS ➜ Azure)

This project accompanies a blog post showing how to model a cross‑cloud Databricks migration using Terraform. It provisions an example Databricks workspace on AWS and an equivalent landing zone on Azure, illustrating the building blocks, variables, and workflow you can adapt to migrate from AWS to Azure.

The repo focuses on standing up cloud resources with Terraform, not on copying notebooks/jobs/clusters or data. For those, see the Migration Workflow section for pointers and options.

# Prerequisites
- Terraform >= 1.13
- Databricks account‑level access (to call MWS/account APIs) and a client/application with client_id/secret
- AWS account with an existing VPC, subnets, and security group
- Azure subscription with permissions to create resource groups and Databricks workspaces
- Locally configured credentials for AWS and Azure (standard provider auth or env vars)

# Provider Versions
- `databricks/databricks ~> 1.96.0`
- `hashicorp/aws ~> 6.19.0`
- `hashicorp/azurerm ~> 4.51.0`

# Migration Workflow
This repo provisions source (AWS) and target (Azure) control planes. Migrating your runtime objects and data typically involves:
- Workspace assets (notebooks, jobs, clusters, repos, secrets)
  - Export from AWS and import to Azure. Options include Databricks REST APIs, the Databricks CLI, or the Databricks Labs migration tool.
- Data and external storage
  - Re‑point to Azure storage (ADLS) or replicate datasets; validate table formats and permissions.
- Identity and permissions
  - Align groups/users/SCIM provisioning on the Azure workspace; map ACLs and secrets.

# Cleanup
- Destroy all resources created by this demo when done:
  - `terraform destroy -var-file=terraform.tfvars`
- If you used `-target` during creation, run a full `destroy` once to ensure dependent resources are removed.