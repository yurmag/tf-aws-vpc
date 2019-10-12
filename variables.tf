terraform {
  required_version = ">0.12.0"
}


variable "tags" {
  type        = map(string)
  description = "Tags (otpional variable)"
  default     = {}
}

variable "vpc_cidr" {
  type        = string
  description = "Primary CIDR block for the VPC"
}

variable "vpc_cidr_secondary" {
  type        = list
  description = "Secondary CIDR blocks for the VPC"

  default = []
}

variable "public_subnet_list" {
  type        = list
  description = "List of maps that describes subnets"

  default = []
}

