terraform {
  backend "s3" {
    bucket = "b2c-tfstate"
    key    = "b2c/s3_cf.tfstate"
    region = "us-west-2"
  }
}
