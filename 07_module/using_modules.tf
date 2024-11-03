provider "aws" {
  region = "eu-west-3"
}

module "create-ec2-01" {
  source = "./modules"
}

module "create-ec2-02" {
  source = "./modules"
  ec2_tag_name = "ec2_02"
}