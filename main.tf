# --- root main.tf ---

module "networking" {
  source             = "./modules/networking"
  security_groups    = local.security_groups
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  subnet-az          = var.az
}

module "file-storage" {
  source       = "./modules/file-storage"
  efs_subnet   = module.networking.public_subnet_id
  efs_mount_sg = module.networking.efs_sg
}

module "compute" {
  source         = "./modules/compute"
  depends_on     = [module.file-storage]
  instance_count = 1
  instance_ami   = "ami-0c2b8ca1dad447f8a"
  instance_type  = "t2.micro"
  user_data_path = "${path.cwd}/userdata.tpl"
  security_group = module.networking.ec2_sg[0]
  ec2_subnet_id  = module.networking.public_subnet_id
  efs_id         = module.file-storage.fs_id
  efs_aws_region = var.aws_region
  fs_ip          = module.file-storage.fs_ip
}