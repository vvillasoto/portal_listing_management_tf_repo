resource "aws_security_group" "rds_sg" {
  name        = "portal-listing-platform-database-secgrp"
  description = "Allow inbound traffic to RDS PostgreSQL DB"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.public-1a.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "portal-listing-platform-database-secgrp"
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = "portal-listing-platform-bastion-secgrp"
  description = "Allow SSH access to bastion host"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["5.195.105.70/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["5.32.104.122/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["5.161.41.67/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "portal-listing-platform-bastion-secgrp"
  }
}