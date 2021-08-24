# --- file-storage/main.tf ---

# File system
resource "aws_efs_file_system" "efs_storage" {
  creation_token   = "efs_storage"
  performance_mode = "generalPurpose"

  lifecycle_policy {
    transition_to_ia = "AFTER_7_DAYS"
  }
}

# Mount target 
resource "aws_efs_mount_target" "efs_mount" {
  file_system_id  = aws_efs_file_system.efs_storage.id
  subnet_id       = var.efs_subnet
  security_groups = var.efs_mount_sg
}