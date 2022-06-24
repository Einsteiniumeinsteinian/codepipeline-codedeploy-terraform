resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "${var.env_details.name}-bucket82121"
}

resource "aws_s3_bucket_acl" "codepipeline_bucket_acl" {
  bucket = aws_s3_bucket.codepipeline_bucket.id
  acl    = "private"
}