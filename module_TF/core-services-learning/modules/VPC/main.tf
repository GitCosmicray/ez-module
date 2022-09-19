

resource "aws_vpc" "VPC_useast-1" {
  cidr_block       = var.cidr_block 
  instance_tenancy = "default"
  tags = {
    Name = "state_file-demo"
 }
}

resource "aws_vpc" "vpc_usE1_testing" {
    for_each =lookup(var.vpc_configuration, "qwerty")
    cidr_block = each.value
    tags = {
        "Name" = each.key
    }
  
}

resource "aws_vpc" "project_A" {
  cidr_block = lookup(var.vpc_configuration, "cidr_block_A")
  instance_tenancy = "default"
  
  tags = {
    Name = "pluto"
  }
}