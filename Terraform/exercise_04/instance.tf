resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "doveLinux" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.dove-pub-subnet-01.id
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = [aws_security_group.doveSG.id]
  tags = {
    Name    = "doveLinux-Instance"
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
    private_key = file("web02_key")
    host        = self.public_ip
  }

}

resource "aws_ebs_volume" "dove-vol-3G" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    "Name" = "extra_EBS_Vol"
  }
}

resource "aws_volume_attachment" "attach_dove_vol" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.dove-vol-3G.id
  instance_id = aws_instance.doveLinux.id
}

output "PublicIP" {
  value = aws_instance.doveLinux.public_ip
}