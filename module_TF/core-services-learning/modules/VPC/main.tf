resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block 
  instance_tenancy = "default"
  tags = {
    Name = "state_file-demo"
 }
}

resource "aws_vpc" "for_each" {
    for_each = var.vpcs
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