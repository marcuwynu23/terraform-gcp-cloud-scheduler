output "job_name" {
  description = "The name of the Cloud Scheduler job"
  value       = google_cloud_scheduler_job.job.name
}

output "job_schedule" {
  description = "The cron schedule of the job"
  value       = google_cloud_scheduler_job.job.schedule
}

output "job_target_uri" {
  description = "The target URI of the job"
  value       = google_cloud_scheduler_job.job.http_target[0].uri
}
