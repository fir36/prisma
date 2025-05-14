resource "aws_s3_bucket" "good_bucket" {
  bucket = "prisma-cloud-good-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "GoodBucket"
    Environment = "Test"
  }
}

resource "aws_security_group" "good_sg" {
  name        = "prisma-cloud-secure-sg"
  description = "Allow HTTPS from trusted source"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/24"] # Replace with valid CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "GoodSG"
    Environment = "Test"
  }
}
