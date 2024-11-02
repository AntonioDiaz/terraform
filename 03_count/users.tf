provider "aws" {
  region = "eu-west-3"
}

variable "environment" { 
    default = "DEV_ENV"
}

variable "user_names" {
  type = list
  default = ["alba", "rafa", "ana"]
}

resource "aws_iam_user" "name" {
  name = "user_${var.user_names[count.index]}_${var.environment}"
  count = 3
}