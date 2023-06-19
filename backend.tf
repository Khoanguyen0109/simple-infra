terraform {
  backend "s3" {
    bucket         = "terraform-remotes"
    key            = "hutbot-backend-visit-deviations.tfstate"
    region         = "eu-west-1"
    encrypt        = "true"
    dynamodb_table = "terraform-lock"
  }
}
