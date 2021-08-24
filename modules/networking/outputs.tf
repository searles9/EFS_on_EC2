#--- networking/outputs.tf ---

output "ec2_sg" {
  value = [aws_security_group.sg["ec2_sg"].id]
}

output "efs_sg" {
  value = [aws_security_group.sg["efs_sg"].id]
}


output "public_subnet_id" {
  value = aws_subnet.public-subnet.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

