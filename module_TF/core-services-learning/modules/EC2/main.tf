

resource "aws_instance" "Ec2-UE1-lookups" {   
    instance_type = lookup(var.ec2_configuration, "instance_type")
    ami = "${lookup(var.aws_amis , var.aws_region)}"
    key_name = lookup(var.ec2_configuration, "key_name")
    tags = lookup(var.s3_configuration, "tags")
 }
 output "Instance-ip" {
   value = aws_instance.Ec2-UE1-lookups.public_ip
}

data "aws_secretsmanager_secret_version" "creds" {
  secret_id = "AWSSecret_UE1_PROD"
}

locals {
   AWSSecret_UE1_PROD= jsondecode(
    data.aws_secretsmanager_secret_version.creds.secret_string
  )
}

resource "aws_instance" "ec2_useast1" {
    ami           = "${lookup(var.aws_amis , var.aws_region)}"
    instance_type =  var.instance_type
    associate_public_ip_address = var.enable_public_ip
    key_name =local.AWSSecret_UE1_PROD.keypair
    tags = var.project_environment
}
