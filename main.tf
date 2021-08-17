# --- root main.tf ---

module "compute" {
  source            = "./compute"
  instance_ami      = "ami-0c2b8ca1dad447f8a"
  instance_type     = "t2.micro"
  user_data_path    = "${path.cwd}/userdata.tpl"
  user_data_message = "Sucessfully deployed an EC2 instance with Apache"
  sg                = aws_security_group.web-sg.id
}

resource "aws_security_group" "web-sg" {
  name = "dps-ec2-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

