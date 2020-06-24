output "repository_id" {
  value = var.enabled ? aws_ecr_repository.this[0].id : ""
}

output "repository_url" {
  value = var.enabled ? aws_ecr_repository.this[0].repository_url : ""
}
