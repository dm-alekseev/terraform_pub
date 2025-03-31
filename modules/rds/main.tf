resource "aws_db_instance" "rds" {
  engine             = "postgres"
  engine_version     = "17.1"
  instance_class     = var.instance_class
  allocated_storage  = var.allocated_storage
  db_name            = var.db_name
  username           = var.username
  password           = var.password
  multi_az               = false
  db_subnet_group_name = var.db_subnet_group_name 
  vpc_security_group_ids = [var.security_group_id]
  skip_final_snapshot = true
}


