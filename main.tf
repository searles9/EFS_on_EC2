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
  ingress = [
    {
      description = "Allow SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    },
    {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    },
    {
      description = "Allow HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]


}

