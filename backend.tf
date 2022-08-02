terraform {
  backend "gcs" {
    bucket = "m-selim-bucket"
    prefix = "terraform/state"
  }
}