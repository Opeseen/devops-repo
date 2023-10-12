resource "aws_security_group" "bank-beanstalk-app-elb-sg" {
  name = "banking-beanstalk-elb-sg"
  description = "Security group for beanstalk"
  vpc_id = module.vpc.vpc_id

  egress = {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_block = ["0.0.0.0/0"]
  }

    ingress = {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_block = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "banking-bastion-sg" {
  name = "javaBank-bastion-sg"
  description = "Security group for the bastion EC2 Instance"
  vpc_id = module.vpc.vpc_id

  egress = {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_block = ["0.0.0.0/0"]
  }

  ingress = {
    from_port = 22
    protocol = "-tcp"
    to_port = 22
    cidr_block = [var.MY_IP_ADDRESS]
  }

}