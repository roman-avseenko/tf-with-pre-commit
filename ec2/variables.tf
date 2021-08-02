variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = ""
}

variable "sg_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = []
}

variable "private_ip" {
  description = "Private IP address to associate with the instance"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = ""
}
