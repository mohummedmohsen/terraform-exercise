# backing up terraform state file in s3 bucket
terraform {
  backend "s3" {
    bucket = "testbuckethomos"
    key    = "testbuckethomos/backend"
    region = "eu-central-1"

  }
}