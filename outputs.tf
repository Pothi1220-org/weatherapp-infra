output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}

output "dynodb_table_name" {
  value = aws_dynamodb_table.terrafrom_locks.name
}