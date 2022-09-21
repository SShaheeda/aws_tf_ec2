variable "ec2_igw_cidr_block" {
    type = string
    description = "cidr range of igw"
    default = "0.0.0.0/0"
}
variable "ec2_vpc_cidr" {
    type = string
    description = "cidr range of vpc"
}

variable "ec2_public_subnet_cidr" {
    type = string
    description = "cidr range of public subnet"
}
variable "ec2_private_subnet_cidr" {
    type = string
    description = "cidr range of private subnet"
    default = ""
}

variable "nat_cidr_block" {
    type = string
    description = "NAT CIDR"
    default="0.0.0.0/0"
}

variable "natinstace" {
    type = string
    description = "natinstace ip"
    default = ""
  
}