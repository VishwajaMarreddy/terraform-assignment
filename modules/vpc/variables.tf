variable "aws_region" {
   type = string
}


variable "vpc_cidr" {
}

variable "env" {
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



