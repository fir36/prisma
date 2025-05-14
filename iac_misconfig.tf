provider "aws" {
  region = "us-east-1"
}

# ✅ Secure S3 Bucket: Private, Encrypted, and No Public Access
resource "aws_s3_bucket" "secure_bucket" {
  bucket = "prisma-cloud-secure-bucket"
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
    Name = "SecureS3"
  }
}

# ✅ Secure Security Group: Limited Ingress
resource "aws_security_group" "secure_sg" {
  name        = "secure_sg"
  description = "Allow HTTPS only"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Replace with a trusted range
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SecureSG"
  }
}

# ✅ Encrypted RDS Database with Basic Configuration
resource "aws_db_instance" "secure_db" {
  identifier         = "prisma-secure-db"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  engine             = "mysql"
  username           = "admin"
  password           = "SuperSecret123!"
  skip_final_snapshot = true

  storage_encrypted = true

  tags = {
    Name = "SecureDB"
  }
}
