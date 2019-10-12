# tf-aws-vpc
This module creates a VPC and the following resources within this VPC:
 - IGW and VGW
 - public subnets
 - route table with a default route via IGW for every subnet
  
Module usage example:

```
module "vpc_01" {
  source = "git::https://github.com/yurmag/tf-aws-vpc.git"

  vpc_cidr           = "10.0.0.0/16"
  vpc_cidr_secondary = [
    "100.64.0.0/16",
    "100.65.0.0/16",
  ]

  public_subnet_list = [
    {
      name   = "vpc01_10.0.1.0/24"
      cird   = "10.0.1.0/24"
      az     = "eu-central-1a"
    },
    {
      name   = "vpc01_10.0.2.0/24"
      cird   = "10.0.2.0/24"
      az     = "eu-central-1a"
    },
  ]

  tags = {
    Env  = "test_us_east-2"
    Name = "test"
  }
}

output "vpc_01_vpc_id" {
  value = module.vpc_01.vpc.id
}

output "vpc_01_vpc_igw" {
  value = module.vpc_01.vpc_igw.id
}

output "vpc_01_vpc_vgw" {
  value = module.vpc_01.vpc_vgw.id
}

output "vpc_01_subnet_list" {
  value = zipmap(
    module.vpc_01.public_subnet_list[*].id,
    module.vpc_01.public_subnet_list[*].cidr_block,
  )
}

output "vpc_01_rts" {
  value = module.vpc_01.route_table_list[*].id
}
```
