provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "myFirstEc2" {
  ami = "ami-080fa3659564ffbb1"
  instance_type = "t2.micro"
  tags = {
    Name = "myFirstEc2Name"
  }
}