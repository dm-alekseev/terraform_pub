provider "aws" {
  region     = var.aws_region
}


#==== VPC ====
module "vpc" {
  source    = "./modules/vpc"
}

#==== SG  ====

module "sg" {
  source   =  "./modules/sg"
  vpc_id   = module.vpc.vpc_id
}

#==== EC2 ====

module "ec2" {
  source          = "./modules/ec2"
  public_subnet   = module.vpc.pub_subnet_id
  private_subnet  = module.vpc.priv_subnet_id[0]
  priv_sg         = module.sg.priv_sg_id
  pub_sg          = module.sg.pub_sg_id
}


#====  DB ====
module "rds" {
  source              = "./modules/rds"
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  db_subnet_group_name = module.vpc.rds_subnet
  security_group_id   = module.sg.rds_sg_id
}
