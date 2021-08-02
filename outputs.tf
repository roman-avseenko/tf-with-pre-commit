output "instance_public_dns" {
  description = "Public DNS name assigned to the instance"
  value       = module.ec2_instance.public_dns
}

output "instance_public_ip" {
  description = "Public IP address assigned to the instance"
  value       = module.ec2_instance.public_ip
}

output "bucket_domain_name" {
  description = "The bucket domain name"
  value       = module.s3_bucket.s3_bucket_domain_name
}
