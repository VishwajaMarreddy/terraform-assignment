terraform {
  backend "s3" {
    bucket  = "state-file-bucket-prod"
    key     = "prod/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
