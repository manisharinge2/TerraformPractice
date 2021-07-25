//This can be copied to your main.tf file. File should be inside a folder where terraform is initialized.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0dc2d3e4c0f9ebd18"
  instance_type = "t2.micro"

  tags = {
    Name = "MyTerraformTestInstance"
  }
}
