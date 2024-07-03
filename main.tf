terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.aws_region
}

module "vscodeweb-instance" {
  source = "./vscodeweb-instance"
  security_id = var.security_id
  availability_zone = var.availability_zone
  aws_region = var.aws_region
  subnet_id = var.subnet_id
  
}


module "vscodeweb-remoteaccess" {
  source = "./vscodeweb-remoteaccess"
}