variable "ec2-instance-name" {
   type = string
}
variable "subnet-id" {
   type = string
}
variable "key-name" {
   type = string
}
variable "vpc-id" {
   type = string
}

variable "repo-url" {
   type = string
}
variable "tag" {
   type = string
}


variable "ec2-securityGroupName" {
  type    = string
}


variable "sg_ingress_rules" {
    type        = map(object(
      {
        from = number
        to = number
        proto = string
        cidr = string
        desc = string
      }
    ))
}


variable "sg_ingress_rules_source" {
    type        = map(object(
      {
        from = number
        to = number
        proto = string
        desc = string
      }
    ))
}



variable "sg_egress_rules" {
    type        = map(object(
      {
        from = number
        to = number
        proto = string
        cidr = string
        desc = string
      }
    ))
}


