variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0f844a9675b22ea32"
    us-east-2 = "ami-0cf0e376c672104d6"
  }
}

variable "USER" {
  default = "ec2-user"
}