provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ubuntuInstance" {
  ami                    = "ami-0866a3c8686eaeeba"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "web_8776_02"
  vpc_security_group_ids = ["sg-081ac4795432a707d"]
  tags = {
    Name : "UbuntuIns"
    Poject : "ubuntu"
  }
}