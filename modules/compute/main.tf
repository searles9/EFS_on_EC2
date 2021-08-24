# --- compute/main.tf ---

resource "random_id" "node_id" {
  byte_length = 2
  count       = var.instance_count
}

resource "aws_instance" "web_node" {
  count                  = var.instance_count
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  subnet_id              = var.ec2_subnet_id
  vpc_security_group_ids = [var.security_group]


  user_data = templatefile(var.user_data_path,
    {
      file-system-id = var.efs_id
      aws-region     = var.efs_aws_region
      fs-ip          = var.fs_ip

  })
  tags = {
    Name = "web_node-${random_id.node_id[count.index].dec}"
  }
}
