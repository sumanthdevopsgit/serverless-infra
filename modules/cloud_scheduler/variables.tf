variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "topic_name" {
  description = "Pub/Sub topic name to which Scheduler publishes"
  type        = string
}

variable "scheduler_frequency" {
  description = "Cron schedule for Cloud Scheduler"
  type        = string
}
variable "job_name" {
  description = "Name of the Cloud Scheduler job"
  type        = string
  default     = "autozone-scheduler-job"
}

variable "time_zone" {
  description = "Time zone for the Cloud Scheduler job"
  type        = string
}