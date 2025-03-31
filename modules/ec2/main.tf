###### main ec2  #########
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "bastion" {
  ami               = "ami-07eef52105e8a2059"
  instance_type     =  var.instance_type
  availability_zone = "eu-central-1a"
  key_name          = "dalekseev"
  tenancy           = "default"
  subnet_id         = var. public_subnet
  security_groups   = [var.pub_sg]
  #vpc_security_group_ids = var.pub_sg
  tags = {
    Name = "bastion"
  }

}

resource "aws_instance" "private" {
  ami               = "ami-07eef52105e8a2059"
  instance_type     = "t2.micro"
  availability_zone = "eu-central-1a"
  key_name          = "dalekseev"
  tenancy           = "default"
  subnet_id         = var.private_subnet
  security_groups   = [var.priv_sg]
  #vpc_security_group_ids = var.pub_sg
  associate_public_ip_address = false
  
  tags = {
    Name = "private" 
  }  
}

