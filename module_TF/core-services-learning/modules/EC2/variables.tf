variable "aws_region" {
  default="us-east-1"
}

variable "aws_amis" {
  default ={
    "ap-southeast-1" = "ami-0b89f7b3f054b957e"
    "us-east-1" = "ami-08d4ac5b634553e16"
  }
  
}


variable "key_name1" {
  default = "n.v_key"
}


variable "app_name" {
  default = "local_test2"
}



variable "instance_type" {
  type = string
  description = "instance type t2.micro"
  default= "t2.micro"
}


variable "enable_public_ip" {
  description = "enable public ip address"
  type = bool
  default = true
}

variable "project_environment" {
  description = "project name and environment"
  type = map(string) 
  default = {
    "Name" = "venus",
    "project" = "project-alpha",
    "environment" ="development"
  }
}


variable "ec2_configuration" {
  type = any
  description = "this is configuration for ec2 in tfvars"
  
  }
