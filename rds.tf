data "aws_db_snapshot" "latest_snapshot" {
  db_instance_identifier        = aws_db_instance.portallistingdb01.identifier
  most_recent                   = true

  # Optionally, add a depends_on to ensure the instance exists before trying to find a snapshot
  # depends_on                    = [aws_db_instance.portallistingdb01] 
}

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
  deletion_protection           = true
  tags = {
    Name        = "portal-listing-pgdb01-prod"
  }

  final_snapshot_identifier     = "portal-listing-pgdb01-prod-final-snapshot"
  skip_final_snapshot           = true

  publicly_accessible  = true
  
  # Conditionally set snapshot_identifier
  # This uses a local variable to determine if a snapshot exists and then sets the identifier.
  # This pattern prevents Terraform from failing if no snapshot is found on the initial apply.
  #snapshot_identifier = coalesce(
  #  data.aws_db_snapshot.latest_snapshot.id,
  #  null
  #)
}