output "subnet_id" {
  value = module.vpc.public_subnets[0]
}

output "sg_id" {
  value = module.ssh_icmp_sg.security_group_id
}
