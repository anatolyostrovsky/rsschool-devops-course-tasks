
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

