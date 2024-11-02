
variable "github_pat" {
  type = string
}

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = var.github_pat
}

resource "github_repository" "example" {
  name        = "testing_terraform_repository"
  description = "My awesome codebase"
  visibility  = "public"
}