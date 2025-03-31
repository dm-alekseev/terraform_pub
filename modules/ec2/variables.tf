variable "aws_region" {
  default = "eu-central-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "public_subnet" {
  description = "Public subnet ID"
  type        = string
}

variable "private_subnet" {
  description = "Private subnet ID"
  type        = string
}

variable "priv_sg" {
  default = ""
}

variable "pub_sg" {
  default = ""
}

