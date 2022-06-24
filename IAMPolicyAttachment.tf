# ec2 role for code deploy access policy
resource "aws_iam_role_policy_attachment" "AmazonEC2RoleforAWSCodeDeploy_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy"
  role = aws_iam_role.ec2_role_for_code_deploy.name
}

# ec2 role for Code deploy s3 policy
resource "aws_iam_role_policy_attachment" "AmazonS3ReadOnlyAccess_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  role = aws_iam_role.ec2_role_for_code_deploy.name
}

# code_deploy_role policy
resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role = aws_iam_role.code_deploy_role.name
}