# Call VPC module
module "vpc" {
  source = "./modules/vpc"

  project_name       = var.project_name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

# Call EC2 module (depends on VPC outputs)
module "ec2" {
  source = "./modules/ec2"

  project_name      = var.project_name
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id
  instance_type     = "t3.micro"
  ami_id	    = "ami-00403f401ee6a4b98"
}

# Output VPC details
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "security_group_id" {
  value = module.vpc.security_group_id
}

# Output EC2 details
output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ec2_public_dns" {
  value = module.ec2.public_dns
}
