# --- root main.tf ---

resource "aws_instance" "web" {
  ami                    = "ami-0c2b8ca1dad447f8a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-sg.id]

  user_data = templatefile("${path.cwd}/userdata.tpl",
    {
      message = "EC2 Deployed Sucessfully"
  })
}

resource "aws_security_group" "web-sg" {
  name = "dps-ec2-sg"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

output "web-address" {
  value = "${aws_instance.web.public_dns}:80"
}
