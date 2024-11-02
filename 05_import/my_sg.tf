# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-03787de81847a4a35"
resource "aws_security_group" "my-security-group" {
  description = "security group for demo"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "http for apache"
    from_port        = 80
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
    }, {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "ssh"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  }]
  name                   = "ebs_security_group"
  name_prefix            = null
  revoke_rules_on_delete = null
  tags                   = {
    Name = "my-imported-sg"
  }
  tags_all               = {}
  vpc_id                 = "vpc-54b5b33d"
}
