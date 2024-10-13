
resource "aws_subnet" "private-subnet-1" {

  vpc_id            = aws_vpc.new.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = var.az1

  tags = {
    Name = "${var.env}-private-subnet-${var.az1}"
  }
}

resource "aws_subnet" "private-subnet-2" {

  vpc_id            = aws_vpc.new.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = var.az2

  tags = {
    Name = "${var.env}-private-subnet-${var.az2}"
  }
}


resource "aws_subnet" "public-subnet-1" {

  vpc_id                  = aws_vpc.new.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = var.az1
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-public-subnet-${var.az1}"
  }
}

resource "aws_subnet" "public-subnet-2" {

  vpc_id                  = aws_vpc.new.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = var.az2
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env}-public-subnet-${var.az2}"
  }
}
