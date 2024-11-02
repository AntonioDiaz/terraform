<h1>Notes: Terraform Associate Certification</h1>

<!-- TOC -->
  * [Links](#links)
  * [Examples](#examples)
    * [01_hello_aws](#01helloaws)
    * [02_hello_github](#02hellogithub)
    * [03_count](#03count)
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
  * Any `*.auto.tfvars` or `*.auto.tfvars.json` files, processed in lexical order of their filenames.
  * Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by an HCP Terraform workspace.)

![image](https://github.com/user-attachments/assets/b75f5814-6310-40ea-b8f3-85f88688c227)








