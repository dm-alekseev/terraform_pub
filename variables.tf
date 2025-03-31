
####  VPC  ######

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_region" {
  default = "eu-central-1"
}



######  EC2  ######

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}



#######  RDS  ######


variable "db_password" {
  default = "password"
}


variable "db_username" {
  default = "user123"
}

variable "db_name" {
  default = "db_name"
}



#output "db_instance_endpoint" {
#  value = module.rds.db_instance_endpoint
#}
