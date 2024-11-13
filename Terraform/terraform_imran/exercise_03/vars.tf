variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-051f7e7f6c2f40dc1"
    us-east-2 = "ami-0cf0e376c672104d6"
  }
}

variable "USER" {
  default = "ec2-user"
}