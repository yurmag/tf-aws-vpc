resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = var.tags
}

resource "aws_vpn_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = var.tags
}
