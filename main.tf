resource "aws_s3_bucket" "bad_bucket" {
  bucket = "prisma-cloud-test-bucket"
  acl    = "public-read" # This is a misconfiguration (public-read ACL)

  tags = {
    Name        = "PrismaCloudTestBucket"
    Environment = "Test"
  }
}

resource "aws_security_group" "bad_security_group" {
  name        = "prisma-cloud-test-sg"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # This is a misconfiguration (open to the world)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "PrismaCloudTestSG"
    Environment = "Test"
  }
}
