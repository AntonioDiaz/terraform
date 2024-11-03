terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.5"
    }
  }
}

variable "ec2_tag_name" {
  type = string
  default = "boring_name"
}

resource "aws_instance" "my-ec2-instance" {
  ami           = "ami-015875403620174eb"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2_tag_name
  }
}