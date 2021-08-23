# --- root main.tf ---

module "networking" {
  source             = "./modules/networking"
  security_groups    = local.security_groups
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  subnet-az          = var.az
}

module "file-storage" {
  source   = "./modules/file-storage"
  subnet   = module.networking.public_subnet_id
  mount-sg = module.networking.main_sg
}

module "loadbalancing" {
  source     = "./modules/loadbalancing"
  lb_sg      = module.networking.main_sg
  lb_subnets = [module.networking.public_subnet_id]
}

module "asg-compute" {
  source = "./modules/asg-compute"
  # launch template
  user_data_path = "${path.cwd}/userdata.tpl"
  fs-id          = module.file-storage.fs-id
  aws-region     = var.aws_region
  sg_ids         = module.networking.main_sg
  subnet         = module.networking.public_subnet_id
  az-placement   = var.az
  # asg

}

# --------------------------------------------------
#module "compute" {
#  source         = "./modules/compute"
#  instance-count = 2
#  instance_ami   = "ami-0c2b8ca1dad447f8a"
#  instance_type  = "t2.micro"
#  user_data_path = "${path.cwd}/userdata.tpl"
#  sg             = module.networking.main_sg[0]
#  ec2_subnet_id  = module.networking.public_subnet_id
#  fs-id          = module.file-storage.fs-id
#  aws-region     = var.aws_region
#}

#load balancer target group 
# finish asg (with health check to ping the test file)