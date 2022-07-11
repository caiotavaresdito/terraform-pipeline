provider "google" {}

resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

resource "google_storage_bucket" "auto-expire" {
  name          = "pipeline-boilerplate-prod-${random_string.random.id}"
  location      = "US"
  force_destroy = true
}