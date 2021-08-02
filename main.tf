terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "faiiinttt-tf-organization"

    workspaces {
      name = "tf-mini-infra"
    }
  }
  required_version = ">= 1.0"

  required_providers {
    aws = ">= 3.46.0"
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "vpc_with_sg" {
  source         = "./vpc"
  cidr           = "192.168.0.0/16"
  public_subnets = ["192.168.0.0/24"]
}

module "ec2_instance" {
  source     = "./ec2"
  subnet_id  = module.vpc_with_sg.subnet_id
  private_ip = "192.168.0.100"
  sg_ids     = [module.vpc_with_sg.sg_id]
  key_name   = "mini_lab"
}

module "s3_bucket" {
  source = "./s3"
}
