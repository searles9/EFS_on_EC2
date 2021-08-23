# ---- modules/asg-compute/main.tf ---

resource "aws_launch_template" "compute-lt" {
  name_prefix            = "compute-lt"
  image_id               = "ami-0c2b8ca1dad447f8a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = var.sg_ids
  network_interfaces {
    subnet_id                   = var.subnet
    associate_public_ip_address = true
  }
  placement {
    availability_zone = var.az-placement
  }
  tags = {
    Name = "compute-lt"
  }
  user_data = templatefile(var.user_data_path,
    {
      file-system-id = var.fs-id
      aws-region     = var.aws-region
    }
  )
}

resource "aws_autoscaling_group" "compute-asg" {
  depends_on         = [aws_launch_template.compute-lt]
  availability_zones = ["us-east-1a"]
  desired_capacity   = 2
  max_size           = 3
  min_size           = 1


  launch_template {
    id      = aws_launch_template.compute-lt.id
    version = "$Latest"
  }
}