terraform {
  required_version = ">= 1.0"
}

data "aws_ami" "this" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }
}

resource "aws_instance" "this" {

  ami                    = data.aws_ami.this.id
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.sg_ids
  private_ip             = var.private_ip
  key_name               = var.key_name

  tags = {
    Name = "instance-tfc-lab"
  }
}
