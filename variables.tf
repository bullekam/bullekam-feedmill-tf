variable "region" {
  type    = string
  default = "us-east-1"
}

variable "name" {
  type    = string
  default = "bullekam-feedmill"
}

variable "container_port" {
  type    = number
  default = 3000
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "cpu" {
  type    = number
  default = 256
}

variable "memory" {
  type    = number
  default = 512
}

# You’ll push an image to ECR; set this tag to whatever you push (e.g. "v1")
# variable "image_tag" {
#   type    = string
#   default = "v1"
# }

variable "environment" {
  type    = string
  default = "dev"
}

variable "domain_name" {
  type    = string
  default = "bullekam.com"
}

variable "deploy_id" {
  type        = string
  description = "Changes each deploy to force a new task definition revision (e.g., git sha)."
  default     = ""
}