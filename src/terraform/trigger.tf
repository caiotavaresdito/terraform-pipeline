resource "google_cloudbuild_trigger" "pr-dev-preview" {
  name           = "terraform-dev-PR"
  description    = "Terraform plan on Pull Request."
  project        = "caio-testing"
  filename       = ".cloudbuild/cicd.yaml"
  included_files = ["sample/dev/**"]

  github {
    owner = "caiotavaresdito"
    name  = "terraform-pipeline"
    pull_request {
      branch          = ".*"
      comment_control = "COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY"
    }

  }
  substitutions = {
    _ENV = "dev"
  }

}

resource "google_cloudbuild_trigger" "pr-dev-deploy" {
  name           = "terraform-dev-Push"
  description    = "Terraform apply on mainline."
  project        = "caio-testing"
  filename       = ".cloudbuild/cicd.yaml"
  included_files = ["sample/dev/**"]

  github {
    owner = "caiotavaresdito"
    name  = "terraform-pipeline"
    push {
      branch = "main"
    }

  }

  substitutions = {
    _ENV = "dev"
  }
}

resource "google_cloudbuild_trigger" "pr-preview" {
  name           = "terraform-prod-PR"
  description    = "Terraform plan on Pull Request."
  project        = "caio-testing"
  filename       = ".cloudbuild/cicd.yaml"
  included_files = ["sample/prod/**"]

  github {
    owner = "caiotavaresdito"
    name  = "terraform-pipeline"
    pull_request {
      branch          = ".*"
      comment_control = "COMMENTS_ENABLED_FOR_EXTERNAL_CONTRIBUTORS_ONLY"
    }

  }
  substitutions = {
    _ENV = "prod"
  }

}

resource "google_cloudbuild_trigger" "pr-deploy" {
  name           = "terraform-prod-Push"
  description    = "Terraform apply on mainline."
  project        = "caio-testing"
  filename       = ".cloudbuild/cicd.yaml"
  included_files = ["sample/prod/**"]

  github {
    owner = "caiotavaresdito"
    name  = "terraform-pipeline"
    push {
      branch = "main"
    }

  }

  substitutions = {
    _ENV = "prod"
  }
}