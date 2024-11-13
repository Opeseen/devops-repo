resource "aws_key_pair" "webKey" {
  key_name   = "web02key"
  public_key = file("web02_key.pub")
}

resource "aws_instance" "tweenInstance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.webKey.key_name
  vpc_security_group_ids = ["sg-07bcc50a3f262a041"]
  tags = {
    Name : "TweenIns"
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
    private_key = file("web02_key")
    host        = self.public_ip
  }
}