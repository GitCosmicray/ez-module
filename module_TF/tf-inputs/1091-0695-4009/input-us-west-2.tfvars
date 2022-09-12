
iam_configuration = {
    "Name"= "production-instance-role"
}


ec2_configuration = {
    "key_name" = "cs_prod_key"
    "instance_type" = "t3.micro"
}

s3_configuration = {
    "tags" =  {
      Name = "tfvars_testing"
      Environment = "dev"
      region = "useast1"
      managed = "k8s"
    }
    
}

vpc_configuration = {
    "cidr_block_A" = "172.16.0.0/16"
qwerty = {
    "cosmic" = "10.0.0.0/16",   
    "clone" = "10.1.0.0/16"
  }
}

