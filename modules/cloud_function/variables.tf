variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Google Cloud region"
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

variable "topic_name" {
  description = "Pub/Sub topic name to trigger Cloud Function"
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