resource "google_cloud_scheduler_job" "pubsub_job" {
  name             = var.job_name #"autozone-scheduler-job"
  description      = "Job to trigger Pub/Sub messages periodically"
  schedule         = var.scheduler_frequency
  project    = var.project_id
  time_zone        = var.time_zone #"Asia/Kolkata"
  pubsub_target {
    topic_name = "projects/${var.project_id}/topics/${var.topic_name}"
    data = base64encode(jsonencode([
      {
      }
    ]))
  }
}
output "job_name" {
  value = google_cloud_scheduler_job.pubsub_job.name
}
