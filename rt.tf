resource "aws_route_table" "this" {
  count = length(var.public_subnet_list)

  vpc_id = aws_vpc.this.id

  tags = merge(
    var.tags,
    map("Name", lookup(var.public_subnet_list[count.index], "name"))
  )
}

resource "aws_route_table_association" "this" {
  count = length(var.public_subnet_list)

  subnet_id      = aws_subnet.this[count.index].id
  route_table_id = aws_route_table.this[count.index].id
}

resource "aws_route" "default" {
  count = length(var.public_subnet_list)

  route_table_id         = aws_route_table.this[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}
