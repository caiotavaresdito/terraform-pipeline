terraform {
  backend "gcs" {
    bucket = "dito-terraform-state"
    prefix = "dev"
  }
}