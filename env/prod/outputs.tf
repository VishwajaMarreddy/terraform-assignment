output "vpc_public_subnets" {
  value = module.vpc.public_sub_ids
}

output "vpc_private_subnets" {
  value = module.vpc.private_sub_ids
}

output "repo_url" {
  value = aws_ecr_repository.ecr_repo.repository_url
}
