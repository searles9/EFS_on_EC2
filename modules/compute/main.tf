# --- compute/main.tf ---
# add launch template - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template
# add auto scaling group - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group

#resource "random_id" "node_id" {
#  byte_length = 2
#  count       = var.instance-count
#}

#resource "aws_instance" "web_node" {
#  count                  = var.instance-count
#  ami                    = var.instance_ami
#  instance_type          = var.instance_type
#  subnet_id              = var.ec2_subnet_id
#  vpc_security_group_ids = [var.sg]


#  user_data = templatefile(var.user_data_path,
#    {
#      file-system-id = var.fs-id
#      aws-region     = var.aws-region

#  })
#  tags = {
#    Name = "web_node-${random_id.node_id[count.index].dec}"
#  }
#}
