# --- root main.tf ---
module "networking" {
  source          = "./networking"
  security_groups = local.security_groups
}

module "compute" {
  source            = "./compute"
  instance_ami      = "ami-0c2b8ca1dad447f8a"
  instance_type     = "t2.micro"
  user_data_path    = "${path.cwd}/userdata.tpl"
  user_data_message = "Sucessfully deployed an EC2 instance with Apache"
  sg                = module.networking.main_sg[0]
}


