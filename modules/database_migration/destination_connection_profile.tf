resource "google_database_migration_service_connection_profile" "destination" {
  location              = var.region
  project    = var.project_id
  connection_profile_id = "${var.environment}-db"
  display_name          = "${var.environment}-db"

  cloudsql {
    settings {
      database_version          = "MYSQL_8_4"
      tier                 = "db-n1-standard-1"
      edition                   = "ENTERPRISE"
      storage_auto_resize_limit = "0"
      activation_policy    = "ALWAYS"
      ip_config {
        enable_ipv4 = true
        require_ssl = false
      }
      auto_storage_increase = true
      data_disk_type        = "PD_HDD"
      data_disk_size_gb     = 10
      source_id             = google_database_migration_service_connection_profile.source.id
      root_password         = "root"
    }
  }
  depends_on = [google_database_migration_service_connection_profile.source]
}
