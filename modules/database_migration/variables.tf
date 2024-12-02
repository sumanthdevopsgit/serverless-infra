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