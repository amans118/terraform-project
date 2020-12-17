resource "aws_instance" "web" {
  count			= "${var.ec2_count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id		= "${var.subnet_id}"
  key_name      = "${aws_key_pair.lambda_key.key_name}"
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "HelloWorld"
  }
}

resource "tls_private_key" "lambda" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "lambda_key" {
  key_name   = "${var.key_name}"
  public_key = "${tls_private_key.lambda.public_key_openssh}"
}



