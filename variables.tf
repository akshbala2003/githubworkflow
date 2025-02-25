variable "env" {
  description = "Environment based on GitLab branch"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "s3_bucket_name" {
  description = "S3 bucket for Terraform backend"
  type        = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for state locking"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Public Subnet CIDR Block"
  type        = string
  default     = "10.0.0.0/24"
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
  default     = "us-west-2a"
}
