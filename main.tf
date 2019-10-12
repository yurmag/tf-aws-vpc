resource "aws_vpc" "this" {
  # CIDR block is a required argument
  cidr_block = var.vpc_cidr

  tags = var.tags
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  # by default, a VPC has a limit of 5 for CIDR block associated with it
  # if the length has more than 4 CIDRs, then only first 4 CIDRs will be processed
  count = length(var.vpc_cidr_secondary) > 4 ? 4 : length(var.vpc_cidr_secondary)

  vpc_id     = aws_vpc.this.id
  cidr_block = var.vpc_cidr_secondary[count.index]
}

### Subnet 

resource "aws_subnet" "this" {
  count = length(var.public_subnet_list)

  # VPC ID and CIDR block are required arguments
  vpc_id     = aws_vpc.this.id
  cidr_block = lookup(var.public_subnet_list[count.index], "cird")

  availability_zone = lookup(var.public_subnet_list[count.index], "az")

  tags = merge(
    var.tags,
    map("Name", lookup(var.public_subnet_list[count.index], "name"))
  )
}
