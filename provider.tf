
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.85.0"
    }
  }
}
provider "aws" {
  shared_config_files      = ["C:/Users/ababhis3/.aws/config"]
  shared_credentials_files = ["C:/Users/ababhis3/.aws/credentials"]
  profile                  = "default"
}

