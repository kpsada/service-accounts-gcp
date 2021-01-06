terraform {
  backend "gcs" {
    bucket  = "kaushalpatel-terraform"
    prefix  = "serviceaccount-1"
  }
}