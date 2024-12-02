resource "google_database_migration_service_connection_profile" "source" {
  location              = var.region
  project    = var.project_id
  connection_profile_id = "${var.environment}-source-profile"
  display_name          = "${var.environment}-source-profile"

  mysql {
    host     = var.source_host
    port     = 3306
    username = var.source_username
    password = var.source_password
  }
}
