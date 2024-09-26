resource "aws_ecr_repository" "ecr_repo" {
  name                 = var.ecr_name
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = var.ecr_name
  }
}

data "aws_ecr_authorization_token" "ecr_token" {}



resource "null_resource" "docker_push" {
	
	  provisioner "local-exec" {
	    command = <<EOF
            aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${aws_ecr_repository.ecr_repo.repository_url}
	    docker tag ${var.local-repo-name}:${var.local-tag} "${aws_ecr_repository.ecr_repo.repository_url}:${var.local-tag}"
	    docker push "${aws_ecr_repository.ecr_repo.repository_url}:${var.local-tag}"
	    EOF
	  }
}
