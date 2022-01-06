output "resources" {
  description = "List of resources created"
  value       = keys(local.manifest)
}
