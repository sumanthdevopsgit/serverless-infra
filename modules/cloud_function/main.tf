resource "google_storage_bucket" "function_source_bucket" {
  name          = "${var.bucket_name}"
  location      = var.region
  project    = var.project_id
  force_destroy = var.force_destroy #true
}

resource "google_storage_bucket_object" "function_source_archive" {
  name   = "Migration.zip"
  bucket = google_storage_bucket.function_source_bucket.name
  source = var.source_path
}

resource "google_cloudfunctions_function" "pubsub_to_bigquery" {
  name        = var.function_name #"pubsub-to-bigquery"
  runtime     = "python310" # Set to Python 3.10 for this example
  entry_point = "hello_pubsub"
  region      = var.region
  project    = var.project_id
  service_account_email = var.service_account_email

  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.function_source_bucket.name
  source_archive_object = google_storage_bucket_object.function_source_archive.name
  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = var.topic_name
  }
}
