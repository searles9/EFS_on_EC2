#--- file-storage/outputs.tf ---

output "fs_id" {
  value = aws_efs_file_system.efs_storage.id
}

output "fs_ip" {
  value = aws_efs_mount_target.efs_mount.ip_address
}