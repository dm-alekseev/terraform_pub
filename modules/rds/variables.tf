
variable "db_identifier" {
  description = "DB instance identifier"
  default = ""
}



variable "db_name" {
  description = "Database name"
   default  = ""
}

variable "username" {
  description = "Database username"
  default  = ""

}

variable "password" {
  description = "Database password"
  default  = ""

}

variable "private_subnet_id" {
  description = "List of private subnet IDs"
  default  = ""
  
}

variable "security_group_id" {
  description = "Security group ID for the RDS instance"
  default  = ""

}

variable "allocated_storage" {
  default = "20"
} 

variable "db_subnet_group_name" {
  default  = ""
}

variable "instance_class" {
  default = "db.t3.micro"
}


