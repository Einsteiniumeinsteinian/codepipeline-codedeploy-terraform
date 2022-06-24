resource "aws_instance" "ec2_server" {
  ami = "ami-0f5094faf16f004eb"
  instance_type = "t2.micro"
  security_groups = [var.security_group_name ]
  iam_instance_profile = aws_iam_instance_profile.ec2_server_instance_profile.name
  user_data = file("installations/install.sh")
  key_name = "${data.aws_key_pair.ec2_kp.key_name}"

  tags = {
    "Name" = "${var.env_details.name}_ec2_server_${var.env_details.environment}"
  }
}

resource "aws_iam_instance_profile" "ec2_server_instance_profile" {
  name = "${var.env_details.name}_ec2_server_instance_profile_${var.env_details.environment}"
  role = aws_iam_role.ec2_role_for_code_deploy.name
}

