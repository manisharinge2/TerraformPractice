//The below code is just a practice code to create an EC2 Instance through a CloudFormation stack. 
//Commands that helped in verifying the code -  "terraform validate"  

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

resource "aws_cloudformation_stack" "network" {
  name = "networking-stack"

  template_body = <<STACK
{
  "Parameters" : {
    "SGId" : {
      "Type" : "String",
      "Default" : "launch-wizard-14",
      "Description" : "Enter a valid security group id."
    }
  },
  "Resources" : {
    "myTerraformInstance2": {
      "Type" : "AWS::EC2::Instance",
      "Properties" : {
        "ImageId" : "ami-0dc2d3e4c0f9ebd18",
	"SecurityGroupIds" : [{ "Ref" : "SGId" }],
        "Tags" : [
          {"Key": "Name", "Value": "myTerraformInstance2"}
        ]
      }
    }
  }
}
STACK
}
