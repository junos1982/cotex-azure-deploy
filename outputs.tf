output "resource_group_names" {
  description = "List of resource group names in the current subscription"
  value       = [for rg in data.azapi_resource_list.resource_groups.output : rg.name]
}

output "resource_groups_raw" {
  description = "Full metadata for the resource groups returned by the Azure Resource Manager API"
  value       = data.azapi_resource_list.resource_groups.output
}
