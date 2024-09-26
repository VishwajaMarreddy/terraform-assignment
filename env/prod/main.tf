 module "vpc" {
   source = "../../modules/vpc"
   aws_region                   = var.aws_region
   env                          = var.env
   vpc_cidr                     = var.vpc_cidr
   pub_subnet_cidr_list         = var.pub_subnet_cidr_list
   pri_subnet_cidr_list         = var.pri_subnet_cidr_list
   az_list_name                 = var.az_list_name
}

module "ecr"{
  source = "../../modules/Docker-registry"
  ecr_name = var.ecr_name
  local-repo-name = var.local-repo-name
  local-tag = var.local-tag
}

module "Ec2"{
  source = "../../modules/Ec2"
  ec2-instance-name = var.ec2-instance-name
  subnet-id = module.vpc.public_sub_ids[0]
  key-name = var.key-name
  vpc-id = module.vpc.vpc_id
  repo-url = module.ecr.repo_url
  tag   = var.local-tag
  ec2-securityGroupName = var.ec2-securityGroupName
  sg_ingress_rules = var.sg_ingress_rules
  sg_ingress_rules_source = var.sg_ingress_rules_source
  sg_egress_rules = var.sg_egress_rules
  lb-sg=module.lb.lb-sg-id

}

module "lb"{
  source = "../../modules/Loadbalancer"
  vpc-id = module.vpc.vpc_id
  instance-id = module.ec2.instance_id
}