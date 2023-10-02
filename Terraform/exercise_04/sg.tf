resource "aws_security_group" "doveSG" {
  vpc_id      = aws_vpc.dove_vpc.id
  name        = "dove-stack-sg"
  description = "Security group for dove ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "allow-ssh connection"
  }
}