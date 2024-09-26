resource "aws_ecr_repository" "ecr_repository" {
  name                 = var.ecr_name
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = var.ecr_name
  }
}