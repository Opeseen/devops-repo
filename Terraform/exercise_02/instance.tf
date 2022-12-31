resource "aws_instance" "amazonLinux" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE
  key_name               = var.KeyPair[var.REGION]
  vpc_security_group_ids = var.SG[var.REGION]
  tags = {
    Name    = "amazonLinux-Instance"
    Project = "Linux"
  }
}