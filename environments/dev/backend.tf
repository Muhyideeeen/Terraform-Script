terraform {
  backend "s3" {
    bucket         = "change-me-terraform-state-bucket"
    key            = "terraform-script/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "change-me-terraform-state-lock"
    encrypt        = true
  }
}
