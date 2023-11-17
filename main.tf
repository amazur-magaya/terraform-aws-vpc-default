
# VPC module
module "default_vpc" {
  source = "git@github.com:magaya-dev/terraform-aws-module-vpc.git"

  name       = var.name
  cidr_block = var.cidr_block
  az_count   = var.az_count


  subnets = {
    public = {
      name_prefix               = "${var.subnet_name_prefix}-public"
      cidrs                     = var.public_cidrs
      nat_gateway_configuration = "single_az" #Can be changed to "all_azs"
    #We can enable tags individually for each subnet group
    #   tags = {
    #     subnet_type = "public"
    #   }
    }

    private = {
      name_prefix             = "${var.subnet_name_prefix}-private"
      cidrs                   = var.private_cidrs
      connect_to_public_natgw = true
    }

    transit_gateway_attachment = {
      name_prefix               = "${var.subnet_name_prefix}-tgw"
      cidrs                     = var.tgw_cidrs
    }
  }

#   vpc_flow_logs = {
#     name_override        = "test"
#     log_destination_type = "cloud-watch-logs"
#     retention_in_days    = 180
#   }
}