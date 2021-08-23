#--- networking/outputs.tf ---

output "main_sg" {
  value = [aws_security_group.sg["main"].id]
}

output "public_subnet_id" {
  value = aws_subnet.public-subnet.id
}