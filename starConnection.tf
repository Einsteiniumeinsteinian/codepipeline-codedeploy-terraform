resource "aws_codestarconnections_connection" "code_star_connections" {
  name          = "${var.env_details.name}_${var.env_details.environment}"
  provider_type = "GitHub"
}