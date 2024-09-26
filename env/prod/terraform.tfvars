env="prod"
aws_region="us-east-1"
vpc_cidr="10.10.0.0/16"
az_list_name=["us-east-1a", "us-east-1b", "us-east-1c" ]
pub_subnet_cidr_list=["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
pri_subnet_cidr_list=["10.10.8.0/22", "10.10.12.0/22", "10.10.16.0/22"]
 
ecr_name="web-app"
local-repo-name="web-app"
local-tag="1"
ec2-instance-name="web-app"
key-name = "vishwaja.pub"
ec2-securityGroupName="web-app-sg"
sg_ingress_rules = {
  "sg1" = { from = 22, to = 22, proto = "TCP", cidr = "0.0.0.0/0", desc = "From anywhere" }
}

sg_ingress_rules_source = {
  "sg2" = { from = 80, to = 80, proto = "TCP", desc = "HTTP from ALB" }
}

sg_egress_rules = {
  "sg4" = { from = 0 , to = 0, proto = "-1", cidr = "0.0.0.0/0", desc = "to anywhere" }
  
}



