module "vpc" {
  source = "git::https://github.com/SShaheeda/aws_tf_vpc.git"
  vpc_cidr = var.ec2_vpc_cidr
  igw_cidr_block = var.ec2_igw_cidr_block
  public_subnet_cidr = var.ec2_public_subnet_cidr
  private_subnet_cidr = var.ec2_private_subnet_cidr
  nat_gateway_instance_id = aws_instance.instance_nat.primary_network_interface_id

}

resource "aws_instance" "instance_public" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  subnet_id    =  module.vpc.public_subnet_id
  key_name = "shaik"
  security_groups=[aws_security_group.mysgp.id]
  associate_public_ip_address=true
 lifecycle {
    ignore_changes = [
      disable_api_termination,ebs_optimized,hibernation,security_groups,
      credit_specification,network_interface,ephemeral_block_device]
  }

  tags = {
    Name = "publicEC2"
  }
}
  resource "aws_instance" "instance_private" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  subnet_id    =  module.vpc.private_subnet_id
  key_name = "shaik"
  security_groups=[aws_security_group.mysgp_private.id]
  
  lifecycle {
    ignore_changes = [
      disable_api_termination,ebs_optimized,hibernation,security_groups,
      credit_specification,network_interface,ephemeral_block_device]
  }

  tags = {
    Name = "privateEC2"
  }
}

resource "aws_instance" "instance_nat" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  subnet_id    =  module.vpc.public_subnet_id
  key_name = "shaik"
  security_groups=[aws_security_group.mysgp_nat.id]
  associate_public_ip_address=true
  source_dest_check = false
  lifecycle {
    ignore_changes = [
      disable_api_termination,ebs_optimized,hibernation,security_groups,
      credit_specification,network_interface,ephemeral_block_device]
  }

  tags = {
    Name = "NATEC2"
  }
}
