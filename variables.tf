variable "region" {
  description = "Region for the database migration."
  type        = string
}

variable "environment" {
  description = "The environment (dev or prod)."
  type        = string
}

variable "source_host" {
  description = "Host for the source MySQL database."
  type        = string
}

variable "source_username" {
  description = "Username for the source MySQL database."
  type        = string
}

variable "source_password" {
  description = "Password for the source MySQL database."
  type        = string
  sensitive   = true
}

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "sql_user_name" {
  description = "The name of the SQL user to be created in Cloud SQL."
  type        = string
}

variable "sql_user_password" {
  description = "The password for the SQL user to be created in Cloud SQL."
  type        = string
  sensitive   = true
}

variable "scheduler_frequency" {
  description = "Cron schedule for Cloud Scheduler"
  type        = string
}

variable "service_account_email" {
  description = "Service account email for Cloud Function"
  type        = string
}

variable "bucket_name" {
  description = "GCS bucket name for Cloud Function source code"
  type        = string
}

variable "source_path" {
  description = "Path to the Cloud Function source code zip file"
  type        = string
}

variable "job_name" {
  description = "Name of the Cloud Scheduler job"
  type        = string
  default     = "autozone-scheduler-job"
}

variable "dataset_id" {
  description = "Dataset ID"
  type        = string
}

variable "table_id" {
  description = "Table ID"
  type        = string
}

variable "time_zone" {
  description = "Time zone for the Cloud Scheduler job"
  type        = string
}

variable "topic_name" {
  description = "Google Cloud Pub/Sub Topic name"
  type        = string
}

variable "function_name" {
  description = "Cloud Function name"
  type        = string
}

variable "force_destroy" {
  description = "Storage bucket force destroy"
  type        = string
}