resource "aws_security_group" "private_sg" {
  vpc_id = var.vpc_id
  tags = {
    Name = "private_sg"
  }

  egress {
    description = "Outgoing & Incoming ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "80"
  }

  ingress {
    description     = "Incoming & Outgoing SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

        #########################
    #from_port   = 0
    #to_port     = 0
    #protocol    = "-1"
    #cidr_blocks = []
        ##########################

}

resource "aws_security_group" "public_sg" {
  #vpc_id = module.vpc.my_vpc.id
  vpc_id = var.vpc_id
  tags = {
    Name = "public_sg"
  }
  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "80"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "rds_sg" {
  tags = {
     Name = "rds-sg"
  }
  
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
