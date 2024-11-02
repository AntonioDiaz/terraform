<h1>Notes: Terraform Associate Certification</h1>

<!-- TOC -->
  * [Links](#links)
  * [Examples](#examples)
    * [01_hello_aws](#01helloaws)
    * [02_hello_github](#02hellogithub)
    * [03_count](#03count)
    * [04_lifecycle](#04lifecycle)
    * [05_import](#05import)
<!-- TOC -->

## Links
* https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-study-003
* https://www.udemy.com/course/terraform-beginner-to-advanced

## Examples
### 01_hello_aws
* Terraform AWS provider
* Creates ec2 and iam user.
* commands:
  * `terraform init`
  * `terraform plan`
  * `terraform destroy`

### 02_hello_github
* Terraform GitHub provider.
* Create and remove GitHub repository.
* Using variable to store the GitHub PAT (Personal Access Token)

![image](https://github.com/user-attachments/assets/4c0f7131-9bd4-4078-884e-3c17e9e27012)

### 03_count
* Example of `count` to create users on AWS.
* User names defined in a variable of type list.
* Commands:
  * `terraform apply -auto-approve` : will `terraform.tfvars` to get the vars
  * `terraform apply -var="environment=env_var"`
  * `terraform apply -var-file="environments/prod.tfvars"`
* Var asignment prececende (later sources taking precedence over earlier ones):
  * Environment variables
  * The `terraform.tfvars` file, if present.
  * The `terraform.tfvars.json` file, if present.
  * Any `*.auto.tfvars` or `*.auto.tfvars.json files, processed in lexical order of their filenames.
  * Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by an HCP Terraform workspace.)

![image](https://github.com/user-attachments/assets/b75f5814-6310-40ea-b8f3-85f88688c227)

### 04_lifecycle
* Code:
```hcl
resource "aws_instance" "my-ec2-instance" {
  ami           = "ami-015875403620174eb"
  instance_type = "t2.micro"
  tags = {
    Name = "my-instance-behavior-02"
  }
   lifecycle {
     ignore_changes = [tags]
   }
}
```

* Test ignore_changes, step to test:
  1. Run `terraform apply` to create an EC2.
  2. Update manually the name of the EC2 instance from the console.
  3. Run `terraform apply` and check the name has no been updated back to the original name.  

![image](https://github.com/user-attachments/assets/fe6373ac-9ed5-46af-b2b3-be1da6dab834)

### 05_import
Terraform import can automatically create the terraform configuration files for the resources you want to import.
https://developer.hashicorp.com/terraform/language/import
Steps:
1. Create manual or use an existing AWS resource, for this example a Security Group  
![image](https://github.com/user-attachments/assets/9576730f-cf3e-4a8c-8c53-79b509799b55)   

2. Create the tf to import to terraform the resources  
    ```hcl
    provider "aws" {
      region = "eu-west-3"
    }
    
    import {
      to = aws_security_group.my-security-group
      id = "sg-03787de81847a4a35"
    }
    ```
3. Import resources, this will create the terraform code with the resources:  
    `terraform plan -generate-config-out=my_sg.tf`  

    Terraform generate content:  
    ```hcl
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
      tags                   = {}
      tags_all               = {}
      vpc_id                 = "vpc-54b5b33d"
    }
    ```
4. Update resources on terraform
    `terraform apply -auto-approve`





