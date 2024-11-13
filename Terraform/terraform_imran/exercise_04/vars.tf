variable "REGION" {
  type    = string
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-051f7e7f6c2f40dc1"
    us-east-2 = "ami-0ada6d94f396377f2"
  }
}

variable "SG" {
  type = map(any)
  default = {
    us-east-1 = ["sg-07bcc50a3f262a041"]
    us-east-2 = ["sg-0072935923ffe1330"]
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "web02_key.pub"
}

variable "PRIV_KEY" {
  default = "web02_key"
}