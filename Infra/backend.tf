### 
terraform {
  backend "s3" {
    bucket = "minhnl-terraform-state-bucket"  # $YOUR S3 bucket
    key    = "terraform/backend-infra"
    region = "ap-southeast-1"
  }
}