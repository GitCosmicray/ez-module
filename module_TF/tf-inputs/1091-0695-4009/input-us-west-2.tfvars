vpc_configuration = {
    "cidr_block_A" = "10.3.0.0/16"
}

ec2_configuration = {
    "key_name" = "cs_prod_key"
    "instance_type" = "t3.micro"
}

s3_configuration = {
    "tags" =  {
      Name = "tfvars_bucket"
      Environment = "dev"
      region = "useast1"
      managed = "k8s"
    }
    "instance_type_2" = "t3.micro"
}