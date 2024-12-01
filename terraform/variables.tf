variable "app" {
  type    = string
  default = "rs-task"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "az1" {
  type    = string
  default = "eu-west-2a"
}

variable "az2" {
  type    = string
  default = "eu-west-2b"
}


variable "thumbprints" {
  type    = list(any)
  default = ["6938fd4d98bab03faadb97b34396831e3780aea1", "1c58a3a8518e8759bf075b76b750d4f2df264fcd"]
}

variable "ec2-bastion-public-key-path" {
  type    = string
  default = "../secrets/ec2-bastion-key-pair.pub"
}

variable "ec2-bastion-private-key-path" {
  type    = string
  default = "../secrets/ec2-bastion-key-pair.pem"
}

variable "ec2-bastion-ingress-ip-1" {
  type    = string
  default = "0.0.0.0/0"
}

variable "k3s_token" {
  type    = string
  default = "qwerty"
}
