#--- file-storage/outputs.tf ---

output "fs-id" {
  value = aws_efs_file_system.file-storage.id
}