terraform {
  backend "s3" {
    bucket = "state-class-ken" #the name of the bucket I created in aws. this is where the state file will go
    key    = "terraform/gitlab_project" # this will be the path inside the s3 where the state file will be stored
    region = "us-east-1"
    #dynamodb_table = "state_class"
  }
}
