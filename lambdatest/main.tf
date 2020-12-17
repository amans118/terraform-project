provider "aws" {
	region = "ap-south-1"
}

module "lambdatest_vpc" {
	source = "../modules/vpc"
	vpc_id = "${module.lambdatest_vpc.vpc_id}"
}


module "lambdatest_ec2" {
	source 		= "../modules/ec2"
	ami_id 		= "ami-0a4a70bd98c6d6441"
	key_name	= "testkey"
	subnet_id 	= "${module.lambdatest_vpc.subnet_id}"
	vpc_security_group_ids = "${module.lambdatest_vpc.vpc_security_group_ids}"
}