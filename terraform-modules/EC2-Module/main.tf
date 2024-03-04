variable "ami_value" {
    description = "amin value"
    default = "ami-00381a880aa48c6c6"

}

variable "instance_type_value" {
    description = "instance value"
    default = "t3.micro"

}



module "aws-ec2-module" {
    source = "../EC2"
    ami_value = var.ami_value
    instance_type_value = var.instance_type_value
  
}