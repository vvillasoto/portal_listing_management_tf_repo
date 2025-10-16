resource "aws_internet_gateway" "portal_listing_igw" {
  vpc_id = aws_vpc.main.id 

  tags = {
    Name = "portal-listing-platform-vpc-igw"
  }
}