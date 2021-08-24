#--root locals.tf --

locals {
  security_groups = {
    ec2_sg = {
      name        = "ec2_sg"
      description = "SG for EC2 Instances"
      ingress = {
        https = {
          from        = 443
          to          = 443
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
        http = {
          from        = 80
          to          = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
        ssh = {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
        nfs = {
          from        = 2049
          to          = 2049
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    }
    efs_sg = {
      name        = "efs_sg"
      description = "SG for EFS"
      ingress = {
        nfs = {
          from        = 2049
          to          = 2049
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    }

  }
}