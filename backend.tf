terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.85.0"
    }
  }

  backend "s3" {
    # These values will be filled by the backend-config parameters in gitlab-ci.yml as they are dynamic
  }
}
