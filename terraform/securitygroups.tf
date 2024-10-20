
resource "aws_security_group" "bastion-host-sg" {
  vpc_id      = aws_vpc.new.id
  name        = "new-sg"
  description = "Security group for Bastion Host"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ec2-bastion-ingress-ip-1]
    description = "Open to Public Internet"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    ipv6_cidr_blocks = ["::/0"]
    description      = "IPv6 route Open to Public Internet"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "IPv4 route Open to Public Internet"
  }

  tags = {
    Name = "${var.env}-sg-bastion-host"
  }
}




resource "aws_security_group" "new-sg-ec2" {
  vpc_id      = aws_vpc.new.id
  name        = "new-sg-ec2"
  description = "Security group for ec2"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
    description = "Open to connections inside VPC"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    ipv6_cidr_blocks = ["::/0"]
    description      = "IPv6 route Open to Public Internet"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "IPv4 route Open to Public Internet"
  }

  tags = {
    Name = "${var.env}-sg-ec2"
  }
}

