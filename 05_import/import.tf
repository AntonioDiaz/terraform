
provider "aws" {
  region = "eu-west-3"
}

import {
  to = aws_security_group.my-security-group
  id = "sg-03787de81847a4a35"
}

# resource "aws_security_group" "my-security-group" {

# }