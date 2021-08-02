terraform {
  required_version = ">= 1.0"
}

resource "aws_s3_bucket" "this" {
  bucket = "bucket-tfc-lab"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
