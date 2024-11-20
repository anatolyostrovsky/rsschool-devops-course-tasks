


resource "aws_instance" "bastion-host-rs" {
  ami                         = "ami-0b4c7755cdf0d9219"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.ec2-bastion-host-key-pair.key_name
  security_groups             = [aws_security_group.bastion-host-sg.id]
  subnet_id                   = aws_subnet.public-subnet-2.id
  associate_public_ip_address = false
}

resource "aws_eip" "ec2-bastion-host-eip" {
  domain = "vpc"
  tags = {
    Name = "${var.app}-ec2-bastion-host-eip-${var.env}"
  }
}

resource "aws_eip_association" "ec2-bastion-host-eip-association" {
  instance_id   = aws_instance.bastion-host-rs.id
  allocation_id = aws_eip.ec2-bastion-host-eip.id
}

resource "tls_private_key" "ec2-bastion-host-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ec2-bastion-host-public-key" {
  depends_on = [tls_private_key.ec2-bastion-host-key-pair]
  content    = tls_private_key.ec2-bastion-host-key-pair.public_key_openssh
  filename   = var.ec2-bastion-public-key-path
}

resource "local_sensitive_file" "ec2-bastion-host-private-key" {
  depends_on      = [tls_private_key.ec2-bastion-host-key-pair]
  content         = tls_private_key.ec2-bastion-host-key-pair.private_key_pem
  filename        = var.ec2-bastion-private-key-path
  file_permission = "0600"
}

resource "aws_key_pair" "ec2-bastion-host-key-pair" {
  depends_on = [local_file.ec2-bastion-host-public-key]
  key_name   = "${var.app}-ec2-bastion-host-key-pair-${var.env}"
  public_key = tls_private_key.ec2-bastion-host-key-pair.public_key_openssh
}
