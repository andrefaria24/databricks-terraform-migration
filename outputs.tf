output "aws_workspace_url" {
  value = databricks_mws_workspaces.aws.workspace_url
}

output "aws_workspace_id" {
  value = databricks_mws_workspaces.aws.workspace_id
}

output "azure_workspace_url" {
  value = azurerm_databricks_workspace.azure.workspace_url
}