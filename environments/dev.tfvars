region = "us-west-2"
vpc_cidr = "10.1.0.0/16"
subnet_cidr = "10.1.0.0/24"
availability_zone = "us-west-2a"
s3_bucket_name = "${TF_STATE_BUCKET}"
dynamodb_table_name = "${TF_STATE_LOCK_TABLE}" 