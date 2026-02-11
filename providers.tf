terraform {
  #required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}


terraform {
  backend "s3" {
    bucket         = "bullekam-poc"
    region         = "us-east-1"
    dynamodb_table = "bullekam-db-poc"
    # encrypt              = true

    # This automatically stores state per workspace:
    # s3://bucket/env:/dev/terraform.tfstate  (prefix varies)
    workspace_key_prefix = "env"
    key                  = "terraform.tfstate"
  }
}



provider "aws" {
  region = var.region
}

