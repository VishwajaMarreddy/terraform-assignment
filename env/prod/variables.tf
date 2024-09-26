variable "aws_region" {
  type = string
}

variable "env" {
  type =  string
}
variable "vpc_cidr" {
  type  = string
}

variable "pub_subnet_cidr_list" {
   type = list(string)
}

variable "az_list_name" {
    type = list(string)
}

variable "pri_subnet_cidr_list" {
   type = list(string)
}


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
        source_security_group_id = string
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


variable "sg_egress_rules_source" {
    type        = map(object(
      {
        from = number
        to = number
        proto = string
        source_security_group_id = string
        desc = string
      }
    ))
}





