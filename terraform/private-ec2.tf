

resource "aws_instance" "private-instance-1" {
  ami             = "ami-0b4c7755cdf0d9219"
  instance_type   = "t3.small"
  key_name        = aws_key_pair.ec2-bastion-host-key-pair.key_name
  security_groups = [aws_security_group.new-sg-ec2.id]
  subnet_id       = aws_subnet.private-subnet-1.id
  user_data = templatefile("user-data-1.sh", {
    token = var.k3s_token
  })
  tags = {
    Name = "${var.env}-ec2-private-1"
  }
}

resource "aws_instance" "private-instance-2" {
  ami             = "ami-0b4c7755cdf0d9219"
  instance_type   = "t3.small"
  key_name        = aws_key_pair.ec2-bastion-host-key-pair.key_name
  security_groups = [aws_security_group.new-sg-ec2.id]
  subnet_id       = aws_subnet.private-subnet-2.id
  depends_on      = [aws_instance.private-instance-1]
  user_data = templatefile("user-data-2.sh", {
    token        = var.k3s_token,
    private_ip_1 = aws_instance.private-instance-1.private_ip
  })
  tags = {
    Name = "${var.env}-ec2-private-2"
  }
}
