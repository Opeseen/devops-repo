resource "aws_instance" "ubuntuAmi" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "dev01-key"
  vpc_security_group_ids = ["sg-07bcc50a3f262a041"]
  tags = {
    Name : "UbuntuIns"
    Poject : "ubuntu"
  }
}
