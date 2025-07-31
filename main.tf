provider "aws" {
  region = var.aws_region
}


resource "aws_s3_bucket" "terraform_state" {
  bucket = "weatherapp-terraform-state-pothi"
  tags = {
    Name = "Terraform State Bucket"
    Environment = "Production"
  }
}

resource "aws_dynamodb_table" "terrafrom_locks" {
    name = "terraform-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "lockID"
    attribute {
      name = "lockID"
      type = "S"
    }
    tags = {
      Name = "Terrafrom Locks Table"
      Environment = "Production"
    }
}

