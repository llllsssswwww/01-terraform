  1 terraform {
  2   # 테라폼 버전 지정
  3   required_version = ">= 1.0.0, < 2.0.0"
  4
  5   # 공급자 버전 지정
  6   required_providers {
  7     aws = {
  8       source  = "hashicorp/aws"
  9       version = "~> 4.0"
 10     }
 11   }
 12 }
 13
 14
 15 provider "aws" {
 16   region = "ap-northeast-2"
 17 }
 18
 19 resource "aws_instance" "aws01_example" {
 20   ami           = "ami-06eea3cd85e2db8ce"
 21   instance_type = "t2.micro"
 22   key_name = "aws01-key"

 23   tags = {
 24     Name = "aws01-terraform-example"
 25   }
 26
 27 }
~
~
