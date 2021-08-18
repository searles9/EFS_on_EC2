#--- networking/outputs.tf ---

output "main_sg" {
  value = [aws_security_group.sg["main"].id]
}