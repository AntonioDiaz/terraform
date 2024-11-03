resource "aws_eip" "lb" {
  vpc = true
}

resource "aws_eip" "lb_02" {
  vpc = true
}