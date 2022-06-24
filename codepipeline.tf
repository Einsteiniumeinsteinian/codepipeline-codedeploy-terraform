resource "aws_codepipeline" "code_pipeline" {
  name     = "${var.env_details.name}_code_pipeline_${var.env_details.environment}"
  role_arn = aws_iam_role.code_pipeline_role.arn
  artifact_store {
    location = aws_s3_bucket.codepipeline_bucket.bucket
    type     = "S3"
    encryption_key {
      id   = data.aws_kms_alias.s3kmskey.id
      type = "KMS"
    }
  }
    stage {
      name = "Source"
      action {
        name             = "Source"
        category         = "Source"
        owner            = "AWS"
        provider         = "CodeStarSourceConnection"
        version          = "1"
        output_artifacts = ["SourceArtifact"]
        configuration = {
          ConnectionArn    = aws_codestarconnections_connection.code_star_connections.arn
          FullRepositoryId = "Einsteiniumeinsteinian/geolocationApp-maven"
          BranchName       = "main"
        }
      }
    }
    stage {
      name = "Build"

      action {
        name             = "Build"
        category         = "Build"
        owner            = "AWS"
        provider         = "CodeBuild"
        input_artifacts  = ["SourceArtifact"]
        output_artifacts = ["BuildArtifact"]
        version          = "1"
        # region           = var.region

        configuration = {
          ProjectName = "${aws_codebuild_project.code_build_project.name}"
        }
      }
    }
    stage {
      name = "${var.env_details.name}_Deploy"

      action {
        name            = "Deploy"
        category        = "Deploy"
        owner           = "AWS"
        provider        = "CodeDeploy"
        input_artifacts = ["BuildArtifact"]
        version         = "1"
        # region          = var.region

        configuration = {
          ApplicationName                = "${aws_codedeploy_app.code_deploy_app.name}"
          DeploymentGroupName            = "${var.env_details.name}_deployment_group_${var.env_details.environment}"
        }
      }
    }
}
