output "bastion_ip" {
  value = aws_eip.ec2-bastion-host-eip.public_ip
}


output "private_ip1" {
  value = aws_instance.private-instance-1.private_ip
}


output "private_ip2" {
  value = aws_instance.private-instance-2.private_ip
}



