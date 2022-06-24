data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_key_pair" "ec2_kp" {
  key_name = var.key_name
  filter {
    name   = "key-name"
    values = [var.key_name]
  }
}

output "fingerprint" {
  value = data.aws_key_pair.ec2_kp.fingerprint
}

output "name" {
  value = data.aws_key_pair.ec2_kp
}

output "id" {
  value = data.aws_key_pair.ec2_kp.id
}

# data "aws_vpc" "default" {
#   default = true
# } 

data "aws_kms_alias" "s3kmskey" {
  name = "alias/aws/s3"
}


