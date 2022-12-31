variable "REGION" {
  type    = string
  default = "us-east-1"
}

variable "ZONE" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0b5eea76982371e91"
    us-east-2 = "ami-0ada6d94f396377f2"
  }
}

variable "SG" {
  type = map(any)
  default = {
    us-east-1 = ["sg-0c16777d5f4679998"]
    us-east-2 = ["sg-0072935923ffe1330"]
  }
}

variable "USER" {
  default = "ec2-user"
}