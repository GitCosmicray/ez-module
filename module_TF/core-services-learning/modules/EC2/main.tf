

resource "aws_instance" "lookups" {   
    instance_type = lookup(var.ec2_configuration, "instance_type")
    ami = "${lookup(var.aws_amis , var.aws_region)}"
    key_name = lookup(var.ec2_configuration, "key_name")
    tags = {
       Name = local.Name
    }
 }
 output "Instance-ip" {
   value = aws_instance.lookups.public_ip
}



resource "aws_instance" "ec2_example" {
    ami           = "${lookup(var.aws_amis , var.aws_region)}"
    instance_type =  var.instance_type
    associate_public_ip_address = var.enable_public_ip
    key_name = var.key_name1
    tags = var.project_environment
}
