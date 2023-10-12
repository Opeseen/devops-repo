resource "aws_security_group" "bank-beanstalk-app-elb-sg" {
  name        = "banking-beanstalk-elb-sg"
  description = "Security group for beanstalk load balancer"
  vpc_id      = module.vpc.vpc_id

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "banking-bastion-sg" {
  name        = "javaBank-bastion-sg"
  description = "Security group for the bastion EC2 Instance"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MY_IP_ADDRESS]
  }

}