data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_iam_role" "ec2_role" {
  name = "ec2-ecr-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "ecr_policy_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-ecr-access-instance-profile"
  role = aws_iam_role.ec2_role.name
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ec2_secgrp.id]
  associate_public_ip_address = "true"
  subnet_id = var.subnet-id
  key_name = var.key-name
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  user_data = file("${path.module}/install-docker.sh")
  tags = {
    Name = var.ec2-instance-name
  } 

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"  # Default for Amazon Linux 2, modify based on your AMI
      private_key = file("~/.ssh/vishwaja")  # Path to your private key file
      host        = self.public_ip
    }

    inline = [
      
      "docker pull var.repo-url:var.tag",

      "docker run -d --name web-app -p 80:80 var.repo-url:var.tag"
    ]
  }
}


resource "aws_security_group" "ec2_secgrp" {
  name        = var.ec2-securityGroupName
  description = "Allow access to EC2"
  vpc_id      = var.vpc-id

  tags = {
    Name = var.ec2-securityGroupName
  }

}

resource "aws_security_group_rule" "ingress_rules" {
  for_each          = var.sg_ingress_rules
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = [each.value.cidr]
  description       = each.value.desc
  security_group_id = aws_security_group.ec2_secgrp.id
}

resource "aws_security_group_rule" "ingress_rules_sg" {
  for_each          = var.sg_ingress_rules_source
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  source_security_group_id   = var.lb-sg
  description       = each.value.desc
  security_group_id = aws_security_group.ec2_secgrp.id
}

resource "aws_security_group_rule" "egress_rules" {
  for_each          = var.sg_egress_rules
  type              = "egress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = [each.value.cidr]
  description       = each.value.desc
  security_group_id = aws_security_group.ec2_secgrp.id
}




