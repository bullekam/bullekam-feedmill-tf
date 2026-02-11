terraform {
  #required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Role used by the Terraform repo workflow (plan/apply)
module "tf_repo_role" {
  source = "../modules/github_oidc_role"

  role_name             = "bullekam-tf-github-actions"
  github_org            = var.github_org
  github_repo           = var.tf_repo
  github_branch         = "main"
  tf_state_bucket_arn   = var.tf_state_bucket_arn
  tf_lock_table_arn     = var.tf_lock_table_arn
  allow_terraform_admin = true
}

# Role used by the App repo workflow (build/push image)
# If you want this role to ONLY push to ECR and NOT touch infra,
# set allow_terraform_admin = false.
module "app_repo_role" {
  source = "../modules/github_oidc_role"

  role_name             = "bullekam-app-github-actions"
  github_org            = var.github_org
  github_repo           = var.app_repo
  github_branch         = "main"
  tf_state_bucket_arn   = var.tf_state_bucket_arn
  tf_lock_table_arn     = var.tf_lock_table_arn
  allow_terraform_admin = false
}
