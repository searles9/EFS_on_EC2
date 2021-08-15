terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
  }
  required_version = ">= 0.14"

  backend "remote" {
    organization = "dps-terraform"

    workspaces {
      name = "terraform-aws-dps"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web" {
  ami                    = "ami-0c2b8ca1dad447f8a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-sg.id]

  user_data = <<-EOF
              #!/bin/bash 
              sudo yum update –y 
              sudo yum install httpd -y 
              sudo service httpd start 
              sudo chkconfig httpd on  
              sudo service httpd status  
              cd /var/www/html 
              echo "<html><body><h1>EC2 Deployed Sucessfully</h1></body></html>"  | sudo tee index.html   
              EOF
}

resource "aws_security_group" "web-sg" {
  name = "dps-ec2-sg"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "web-address" {
  value = "${aws_instance.web.public_dns}:8080"
}
