

#------------Remote State S3 Bucket-----------------

# Creating S3 Bucket for Terraform
resource "aws_s3_bucket" "rs_task_bucket9194" {
  bucket = "tfstate-bucket919450"
  tags = {
    Name = "new-S3Bucket"
  }
}

# Attaching versioning to the Bucket

resource "aws_s3_bucket_versioning" "Bucket_Versioning" {
  bucket = aws_s3_bucket.rs_task_bucket9194.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Attaching Encryption to the Bucket

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.rs_task_bucket9194.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
