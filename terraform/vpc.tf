
resource "aws_vpc" "new" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.app}-main"
  }
}

resource "aws_internet_gateway" "new-igw" {
  vpc_id = aws_vpc.new.id

  tags = {
    Name = "${var.env}-igw"
  }
}

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.env}-nat"
  }
}

resource "aws_nat_gateway" "new-nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "${var.env}-natgw"
  }

  depends_on = [aws_internet_gateway.new-igw]
}
