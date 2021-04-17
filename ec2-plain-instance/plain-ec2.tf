terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-013f17f36f8b1fefb"
  instance_type = "t2.micro"

  tags = {
    Name = "AWS-Plain-EC2-Instance-By-Manshi"
  }
}

output "ip" {
  description = "These are the public Ip of EC2 instance"
  value       = aws_instance.app_server.public_ip
}


