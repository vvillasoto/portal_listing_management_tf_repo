resource "aws_route_table" "vpc_public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.portal_listing_igw.id
  }

  tags = {
    Name = "portal-listing-platform-vpc-public-route-table"
  }
}

resource "aws_route_table_association" "vpc_public_subnet_association" {
  subnet_id      = aws_subnet.public-1a.id
  route_table_id = aws_route_table.vpc_public_route_table.id
}