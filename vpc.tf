resource "aws_vpc" "main" {
  cidr_block = "10.203.100.0/24"
  tags = {
    Name        = "portal-listing-platform-vpc"
  }
}