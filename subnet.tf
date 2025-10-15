resource "aws_subnet" "public-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.203.100.0/28"
  availability_zone = "me-central-1a"
  tags = {
    Name        = "portal-listing-platform-public-subnet-1a"
  }

  depends_on = [aws_vpc.main]
}

resource "aws_subnet" "private-1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.203.100.16/28"
  availability_zone = "me-central-1a"
  tags = {
    Name        = "portal-listing-platform-private-subnet-1a"
  }
}

resource "aws_subnet" "private-1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.203.100.32/28"
  availability_zone = "me-central-1b"
  tags = {
    Name        = "portal-listing-platform-private-subnet-1b"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "portal-listing-platform-db-subnet-group"
  subnet_ids = [aws_subnet.private-1a.id, aws_subnet.private-1b.id]
  tags = {
    Name        = "portal-listing-platform-db-subnet-group"
  }
}