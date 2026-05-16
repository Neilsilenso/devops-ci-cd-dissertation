terraform {
  backend "s3" {
    bucket         = "devops-dissertation-tfstate-928747699970"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "devops-dissertation-terraform-lock"
    encrypt        = true
  }
}
