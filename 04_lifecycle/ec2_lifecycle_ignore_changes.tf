terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

`resource "aws_instance" "my-ec2-instance" {
  ami           = "ami-015875403620174eb"
  instance_type = "t2.micro"
  tags = {
    Name = "my-instance-behavior-02"
  }
   lifecycle {
     ignore_changes = [tags]
   }
}`