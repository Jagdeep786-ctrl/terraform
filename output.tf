output "ec2_public_ip" {
    value = [for key in aws_instance.my-instance: key.public_ip]
    description = "Public IP address of the EC2 instance"
  
}

output "ec2_private_ip" {
    value = [for key in aws_instance.my-instance: key.private_ip]
    description = "Private IP address of the EC2 instance"
}

output "ec2_public_dns" {
    value =[for key in  aws_instance.my-instance: key.public_dns]
    description = "Public DNS of the EC2 instance"
}
