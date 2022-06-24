resource "aws_codedeploy_app" "code_deploy_app" {
  compute_platform = "Server"
  name             = "${var.env_details.name}_code_deploy_app_${var.env_details.environment}"
}

resource "aws_sns_topic" "sns_topic" {
  name = "${var.env_details.name}_sns_topic_${var.env_details.environment}"
}

resource "aws_codedeploy_deployment_group" "deployment_group" {
  app_name              = aws_codedeploy_app.code_deploy_app.name
  deployment_group_name = "${var.env_details.name}_deployment_group_${var.env_details.environment}"
  service_role_arn      = aws_iam_role.code_deploy_role.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "${var.env_details.name}_ec2_server_${var.env_details.environment}"
    }
  }

  trigger_configuration {
    trigger_events     = ["DeploymentFailure"]
    trigger_name       = "${var.env_details.name}_trigger_${var.env_details.environment}"
    trigger_target_arn = aws_sns_topic.sns_topic.arn
  }
  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  alarm_configuration {
    alarms  = ["my-alarm-name"]
    enabled = true
  }
}

