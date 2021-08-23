# --- file-storage/main.tf ---

# File system
resource "aws_efs_file_system" "file-storage" {
  creation_token   = "file-storage"
  performance_mode = "generalPurpose"

  lifecycle_policy {
    transition_to_ia = "AFTER_7_DAYS"
  }
}

# Mount target 
resource "aws_efs_mount_target" "efs" {
  file_system_id  = aws_efs_file_system.file-storage.id
  subnet_id       = var.subnet
  security_groups = var.mount-sg
}