variable "vpc-id" {
   type = string
}

variable "instance-id" {
   type = string
}
variable "lb-sg-id" {
   type = string
}

variable "lb-subnet-ids" {
   type = list(string)
}

