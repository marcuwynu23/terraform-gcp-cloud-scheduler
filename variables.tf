variable "project_id" {
  description = "The GCP project ID where the Cloud Scheduler job will be created"
  type        = string
}

variable "region" {
  description = "The region for the Cloud Scheduler job (Free Tier: us-central1, us-east1, us-west1)"
  type        = string
  default     = "us-central1"

  validation {
    condition     = contains(["us-central1", "us-east1", "us-west1"], var.region)
    error_message = "Region must be one of us-central1, us-east1, or us-west1."
  }
}

variable "job_name" {
  description = "The name of the Cloud Scheduler job"
  type        = string
  default     = "my-scheduler-job"
}

variable "job_description" {
  description = "The description of the Cloud Scheduler job"
  type        = string
  default     = "Triggers a Cloud Run service periodically"
}

variable "schedule" {
  description = "The cron schedule for the job (e.g. '0 */3 * * *' for every 3 hours)"
  type        = string
  default     = "0 */3 * * *"
}

variable "time_zone" {
  description = "The time zone for the schedule"
  type        = string
  default     = "UTC"
}

variable "attempt_deadline" {
  description = "The deadline for job execution attempts"
  type        = string
  default     = "180s"
}

variable "http_method" {
  description = "The HTTP method for the target"
  type        = string
  default     = "POST"
}

variable "target_uri" {
  description = "The URI of the HTTP target"
  type        = string
  default     = "https://your-cloud-run-service-uc.a.run.app"
}

variable "body" {
  description = "The body of the HTTP request"
  type        = string
  default     = "{\"schedule\": \"trigger\"}"
}

variable "headers" {
  description = "The headers for the HTTP request"
  type        = map(string)
  default     = { "Content-Type" = "application/json" }
}

variable "oidc_sa_email" {
  description = "The service account email for OIDC authentication"
  type        = string
  default     = ""
}

variable "oidc_audience" {
  description = "The audience for OIDC authentication"
  type        = string
  default     = ""
}
