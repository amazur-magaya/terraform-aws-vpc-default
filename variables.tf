
variable "aws_region" {
  description = "AWS Region."
  type        = string

  default = "us-east-1"
}

variable "name" {
  type        = string
  description = "Name to give VPC. Note: does not effect subnet names, which get assigned name based on name_prefix."
}

variable "subnet_name_prefix" {
  type        = string
  description = "Name prefix for all subnets."
}

variable "cidr_block" {
  description = "IPv4 CIDR range to assign to VPC if creating VPC or to associate as a secondary IPv6 CIDR. Overridden by var.vpc_id output from data.aws_vpc."
  default     = null
  type        = string
}

variable "az_count" {
  type        = number
  description = "Searches region for # of AZs to use and takes a slice based on count. Assume slice is sorted a-z."
}

variable "public_cidrs" {
  type        = list(string)
  description = "List of Public CIDRs."
}

variable "private_cidrs" {
  type        = list(string)
  description = "List of Private CIDRs."
}

variable "tgw_cidrs" {
  type        = list(string)
  description = "List of Transit Gateway CIDRs."
}
