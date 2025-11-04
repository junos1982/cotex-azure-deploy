output "resource_group_names" {
  description = "Names of resource groups in the current subscription"
  value       = local.resource_group_names
}

output "resource_groups_raw" {
  description = "Full metadata for the resource groups returned by the Azure Resource Graph query"
  value       = local.resource_groups
}
