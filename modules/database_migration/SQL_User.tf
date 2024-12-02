resource "google_sql_user" "destination_user" {
  name       = var.sql_user_name
  password   = var.sql_user_password
  project    = var.project_id
  instance   = google_database_migration_service_connection_profile.destination.connection_profile_id
  depends_on = [google_database_migration_service_connection_profile.destination]
}