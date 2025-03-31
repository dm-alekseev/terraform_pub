# VPC outputs
output "public_instance" {
  value = aws_instance.bastion.id
}

output "private_instance" {
  value = aws_instance.private.id
}







