variable "aws_region" {
  description = "Aws region for jenkin server"
  type = string
  default = "us-east-1"
}

variable "instance_type"{
 description = "EC2 instance type"
 type = string
 default = "t2.medium" #jenkins needs more ram than t2.micro
}

variable "key_name"{
  description = "AWS Key pair for SSH"
  type = string
}

variable "ami_id" {
  description = "Amazon linux 2 AMI"
  default = "ami-08c40ec9ead489470" # Amazon Linux 2 us-east-1
}
