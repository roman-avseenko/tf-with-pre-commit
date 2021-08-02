variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "0.0.0.0/0"
}

variable "public_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}
