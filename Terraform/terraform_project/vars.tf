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
    us-east-1 = "ami-0261755bbcb8c4a84"
    us-east-2 = "ami-053b0d53c279acc90"
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
  default = "ubuntu"
}

variable "PUB_KEY" {
  default = "web02_key.pub"
}

variable "PRIV_KEY" {
  default = "web02_key"
}

variable "MY_IP_ADDRESS" {
  default = "197.210.52.183/32"
}

variable "INSTANCE_COUNT" {
  default = "1"
}

variable "VPC_NAME" {
  default = "banking-vpc"
}

variable "VPC_CIDR" {
  default = "172.21.0.0/16"
}

variable "PUB_SUB1_CIDR" {
  default = "172.21.1.0/24"
}

variable "PUB_SUB2_CIDR" {
  default = "172.21.2.0/24"
}

variable "PUB_SUB3_CIDR" {
  default = "172.21.3.0/24"
}

