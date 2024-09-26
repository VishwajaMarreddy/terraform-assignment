output "lb-sg-id"{
    value = aws_security_group.web_app_alb_sg.id
}
output "instance_id"{
    value = aws_instance.web.id
}
