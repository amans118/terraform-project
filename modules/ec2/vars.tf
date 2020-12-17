variable "ami_id" {}
variable "key_name" {}

variable "instance_type" {
	default = "t3a.micro"
}

variable "ec2_count" {
	default = "1"
}

variable "subnet_id" {
	
}

variable "vpc_security_group_ids" {
	
}