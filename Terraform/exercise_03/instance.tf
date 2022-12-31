resource "aws_key_pair" "amazonLinux" {
  key_name   = "web02-key"
  public_key = file("web02-key.pub")
}

resource "aws_instance" "amazonLinux" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE
  key_name               = aws_key_pair.amazonLinux.key_name
  vpc_security_group_ids = var.SG[var.REGION]
  tags = {
    Name    = "amazonLinux-Instance"
    Project = "Linux"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("web02-key")
    host        = self.public_ip
  }

}