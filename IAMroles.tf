# EC2 IAM ROLE
resource "aws_iam_role" "ec2_role_for_code_deploy" {
  name = "${var.env_details.name}_ec2_role_for_code_deploy_${var.env_details.environment}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
  EOF
}


# Code pipeline role
resource "aws_iam_role" "code_pipeline_role" {
  name = "${var.env_details.name}_code_pipeline_role_${var.env_details.environment}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "codepipeline.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
  EOF
}

# Code deplot iam role
resource "aws_iam_role" "code_deploy_role" {
  name = "${var.env_details.name}_code_deploy_role_${var.env_details.environment}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "codedeploy.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
  EOF
}

# Code build
resource "aws_iam_role" "code_build_role" {
  name = "${var.env_details.name}_code_build_role_${var.env_details.environment}"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}