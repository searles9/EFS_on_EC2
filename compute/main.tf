# --- compute/main.tf ---

resource "random_id" "node_id" {
  byte_length = 4
}

resource "aws_instance" "web_node" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.sg]

  user_data = templatefile(var.user_data_path,
    {
      message = var.user_data_message
  })
  tags = {
    Name = "web_node-${random_id.node_id.dec}"
  }
}
