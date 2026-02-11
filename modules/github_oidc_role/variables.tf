variable "role_name" {
  type = string
}

variable "github_org" {
  type = string
}

variable "github_repo" {
  type = string
}

variable "github_branch" {
  type    = string
  default = "main"
}

# Existing TF backend resources (you created manually)
variable "tf_state_bucket_arn" {
  type = string
}

variable "tf_lock_table_arn" {
  type = string
}

# Extra permissions toggle
variable "allow_terraform_admin" {
  type    = bool
  default = true
}
