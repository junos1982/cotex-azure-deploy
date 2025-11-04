terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

data "azurerm_resource_graph_query" "resource_groups" {
  query = <<QUERY
resourcecontainers
| where type == 'microsoft.resources/subscriptions/resourcegroups'
| project id, name, location, tags, properties
QUERY

  subscriptions = [data.azurerm_client_config.current.subscription_id]
}

locals {
  resource_graph_result = jsondecode(data.azurerm_resource_graph_query.resource_groups.result_json)
  resource_groups       = try(local.resource_graph_result.data, [])
  resource_group_names  = [for rg in local.resource_groups : rg.name]
}
