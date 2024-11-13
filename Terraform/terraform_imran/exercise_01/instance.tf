provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ubuntuInstance" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "dev01-key"
  vpc_security_group_ids = ["sg-07bcc50a3f262a041"]
  tags = {
    Name : "UbuntuIns"
    Poject : "ubuntu"
  }
}