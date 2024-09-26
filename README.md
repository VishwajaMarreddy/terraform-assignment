### Terraform Assignment
### Problem Statement
- Create VPC, ECR, Ec2, Loadbalancer through terraform. Build static web page using docker locally and Push/deploy in Ec2 machine through terraform.
#### Steps Followed
- Created a dockerfile with nginx as base image and added sample index.html to it.
- Build the dockerfile locally using docker build command

- Structured the terraform code using modules.
- Modules
	- VPC
	- Ecr
	- Ec2
	- Loadbalancer
- After Ecr repo creation, Used local-exec provisioner to push locally build docker image to repo.
- In Ec2 machine, Used remote-exec provisioner to pull and run docker image from ecr repo.
- As Access to web page has to be restricted only through Loadbalancer, Loadbalancer security group is added in the ec2 security group inbound rules.

#### Commands
- terraform init
- terraform plan
- terraform apply
- To destory entire infra use "terraform destroy"

