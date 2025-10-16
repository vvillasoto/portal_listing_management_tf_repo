resource "aws_vpc" "main" {
  cidr_block = "10.203.100.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "portal-listing-platform-vpc"
  }
}