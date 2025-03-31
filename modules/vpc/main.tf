###  main vpc ###
provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "my_vpc" {
  
  cidr_block = var.vpc_cidr
 
  tags = {
    Name = "my_vpc"
  }
}

#####  Subnet public  #####
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_subnets_cidr
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}

######  Subnet private  ####
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  count = 2
  #cidr_block              = var.private_subnets_cidr
  #availability_zone       = "eu-central-1a"
  #map_public_ip_on_launch = true
  #tags = {
  #  Name = "private_subnet"
  #}
  cidr_block = "10.0.${count.index + 2}.0/24"
  availability_zone = element(["eu-central-1a", "eu-central-1b"], count.index)
  tags = {
      Name = "private_subnet_${count.index}" 
  }

}

#### Sub RDS 

resource "aws_db_subnet_group" "rds" {
  subnet_ids = aws_subnet.private_subnet[*].id
  tags= {
   Name = "DB-subnet-group"
 }
}

######  Gateway  #####
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_igw"
  }
}

resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.my_igw.id
 }

 tags = {
   Name = "2nd Route Table"
 }
}


resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.my_rt.id
}

###### NAT ######
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "my_nat_gateway"
  }
  #depends_on = [aws_internet_gateway.my_igw]
}

resource "aws_eip" "nat_eip" {
  #vpc = true
  domain ="vpc"
}


