terraform {
  backend "s3" {
    bucket  = "State-file-bucket"
    key     = "prod/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
