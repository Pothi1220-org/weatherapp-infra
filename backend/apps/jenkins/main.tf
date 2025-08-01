provider "aws"{
  region = var.aws_region
}

resource "aws_security_group" "jenkins_sg" {
  name = "Jenkins-SG"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    to_port = 22
    from_port = 2
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port = 8080
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "connections from jenkins"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  root_block_device {
    volume_size = 28
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amaamazon-linux-extras install java-openjdk11 -y
              wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
              rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
              yum install jenkins git -y
              systemctl enable jenkins
              systemctl start jenkins
              EOF
  
  tags = {
    Name = "Jenkins-server"
  }
}
