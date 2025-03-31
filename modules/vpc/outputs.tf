#### outputs vpc ###

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "pub_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "priv_subnet_id" {
  value = aws_subnet.private_subnet[*].id
}

output "rds_subnet" { 
   value = aws_db_subnet_group.rds.name
}



