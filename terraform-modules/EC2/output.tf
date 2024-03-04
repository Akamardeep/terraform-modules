output "public-ip-address" {
    value = aws_instance.amardeep.public_ip
   
  
}
output "private-ip-address" {
    value = aws_instance.amardeep.private_ip
   
  
}

output "instance-name" {
    value = aws_instance.amardeep.id
   
  
}