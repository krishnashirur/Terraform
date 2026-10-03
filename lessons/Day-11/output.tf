output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_network_security_group" {
 value = azurerm_network_security_group.example.name
}

output "rgname" {
  value = azurerm_resource_group.rg.name
}


output "nsg_rules" {
  value = local.nsg_rules
}

  output "backup_name" {
  value = var.backup_name
}


output "credentials" {
  value = var.credential
  sensitive = true
}


output "config_file_status" {
  description = "Existence, directory and status of each configuration file."
  value       = local.path_status
}

output "missing_config_files" {
  description = "Paths of files that do not exist."
  value = [
    for path, check in local.path_checks : path
    if !check.exists
  ]
}