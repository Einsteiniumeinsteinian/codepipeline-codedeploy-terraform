resource "aws_codebuild_project" "code_build_project" {
  name          = "${var.env_details.name}_code_build_project${var.env_details.environment}"
  description   = "test_codebuild_project"
  build_timeout = "5"
  service_role  = aws_iam_role.code_build_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }
  }

  source {
    type            = "CODEPIPELINE"
  
  }

  tags = {
    Environment = "${var.env_details.name}_code_build_project_${var.env_details.environment}"
  }
}
