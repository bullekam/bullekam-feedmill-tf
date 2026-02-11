output "tf_repo_role_arn" {
  value = module.tf_repo_role.role_arn
}

output "app_repo_role_arn" {
  value = module.app_repo_role.role_arn
}
