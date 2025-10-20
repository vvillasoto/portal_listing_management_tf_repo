resource "aws_db_instance" "portallistingdb01" {
  identifier                    = "portal-listing-pgdb01-prod"
  allocated_storage             = 20
  max_allocated_storage         = 100
  engine                        = "postgres"
  engine_version                = "16.8" # Specify your desired PostgreSQL version
  instance_class                = "db.t3.micro"
  db_name                       = "portallistingdb01"
  username                      = "postgres" # Replace with a secure username
  manage_master_user_password   = true
  master_user_secret_kms_key_id = aws_kms_key.main.key_id
  db_subnet_group_name          = aws_db_subnet_group.default.name
  vpc_security_group_ids        = [aws_security_group.rds_sg.id]
  performance_insights_enabled  = false
  monitoring_interval           = 0
  multi_az                      = false
  deletion_protection           = false
  final_snapshot_identifier     = "portal-listing-pgdb01-prod-final-snapshot-${formatdate("YYYYMMDDhhmmss", timestamp())}"
  skip_final_snapshot           = false
  publicly_accessible           = false
  storage_encrypted             = true
  kms_key_id                    = aws_kms_key.main.arn
  tags                          = {
    Name                        = "portal-listing-pgdb01-prod"
  }
  
}