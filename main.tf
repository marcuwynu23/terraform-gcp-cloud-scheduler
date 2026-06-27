provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "scheduler_api" {
  service            = "cloudscheduler.googleapis.com"
  disable_on_destroy = false
}

resource "google_cloud_scheduler_job" "job" {
  name             = var.job_name
  description      = var.job_description
  schedule         = var.schedule
  time_zone        = var.time_zone
  attempt_deadline = var.attempt_deadline

  http_target {
    http_method = var.http_method
    uri         = var.target_uri
    body        = base64encode(var.body)
    headers     = var.headers

    oidc_token {
      service_account_email = var.oidc_sa_email
      audience              = var.oidc_audience
    }
  }

  depends_on = [google_project_service.scheduler_api]
}
