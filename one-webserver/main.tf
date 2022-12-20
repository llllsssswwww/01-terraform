terraform {
  # 테라폼 버전 지정
     required_version = ">= 1.0.0, < 2.0.0"
  
     # 공급자 버전 지정
     required_providers {
       aws = {
         source  = "hashicorp/aws"
         version = "~> 4.0"
      }
    }
  }
 
 
provider "aws" {
  region = "ap-northeast-2"
}
 
resource "aws_instance" "aws01_example" {
  ami                    = "ami-06eea3cd85e2db8ce" # ubuntu 20.04 version
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name = "aws01-key"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF
 
 # tags 추가 
  tags = {
    Name = "aws01-terraform-example"
  }
}

# 보안그룹 생성
resource "aws_security_group" "instance" {
  name = "aws01-terraform-example-instance"
 
  ingress {
    from_port   = var.server_port #출발포트 
    to_port     = var.server_port #도착 포트 
    protocol    = "tcp" # 프로토콜
    cidr_blocks = ["0.0.0.0/0"] #송신지 
  }
}
 
  # 출력 지정
output "public-ip" {
  value       = aws_instance.aws01_example.public_ip
  description = "The public IP of the Instance"
}
