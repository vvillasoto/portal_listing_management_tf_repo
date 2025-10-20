resource "aws_instance" "bastion" {
  ami           = "ami-0fef9c511a52d9d03" # Ubuntu Server 24.04 LTS (HVM)
  instance_type = "t3.micro"
  key_name      = aws_key_pair.portal-listing-prod-keypair.key_name
  subnet_id     = aws_subnet.public-1a.id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "portal-listing-bastion-host"
  }
}

resource "aws_key_pair" "portal-listing-prod-keypair" {
    key_name   = "portal-listing-prod-keypair"
    public_key = file("./ssh_keypair/portal-listing-keypair.pem.pub")
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "bastion_public_dns" {
  value = aws_instance.bastion.public_dns
}