terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
  }
}

provider "github" {
  token = var.pat_token
}

resource "github_repository" "terraform-practice" {
  name = "terraform-practice"
}