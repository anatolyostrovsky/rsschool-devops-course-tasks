output "bastion_ip" {
  value = aws_eip.ec2-bastion-host-eip.public_ip
}



