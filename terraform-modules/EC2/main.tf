variable "ami_value" {
  description = "value for ami"
  default = "ami-00381a880aa48c6c6"#dont give default 
}

variable "instance_type_value" {
  description = "value for "
  default = "t3.micro"
}


resource "aws_instance" "amardeep" {
  ami = var.ami_value
  instance_type =var.instance_type_value
  
}