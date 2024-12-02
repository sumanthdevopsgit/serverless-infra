resource "google_database_migration_service_migration_job" "migration_job" {
  location         = var.region
  project    = var.project_id
  migration_job_id = "${var.environment}-migration-job"
  display_name     = "${var.environment}-migration-job"

  static_ip_connectivity {}

  source      = google_database_migration_service_connection_profile.source.name
  destination = google_database_migration_service_connection_profile.destination.name
  type        = "CONTINUOUS"
  provisioner "local-exec" {
    command = "gcloud database-migration migration-jobs start ${var.environment}-migration-job --region=${var.region} --project=${var.project_id}"
  }

  depends_on = [
    google_database_migration_service_connection_profile.source,
    google_database_migration_service_connection_profile.destination
  ]
}