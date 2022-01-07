output "resources" {
  description = "List of resources created"
  value       = keys(data.kubectl_file_documents.manifest.manifests)
}
