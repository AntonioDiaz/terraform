terraform {
  backend "s3" {
    bucket = "bucket.terraform.state.adiaz"
    key    = "network/terraform.tfstate"
    region = "eu-west-3"
  }
}
