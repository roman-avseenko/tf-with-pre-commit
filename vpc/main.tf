terraform {
  required_version = ">= 1.0"
}

data "aws_availability_zones" "this" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-tfc-lab"
  cidr = var.cidr

  azs            = data.aws_availability_zones.this.names
  public_subnets = var.public_subnets

  enable_dns_hostnames = true
}

module "ssh_icmp_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name   = "tfc-lab-sg"
  vpc_id = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}
