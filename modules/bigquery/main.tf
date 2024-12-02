resource "google_bigquery_dataset" "autozone_dataset" {
  project    = var.project_id
  dataset_id = var.dataset_id   #"autozone_dataset_poc2"
  location   = var.region
  
}

resource "google_bigquery_table" "autozone_table" {
  project    = var.project_id
  dataset_id = google_bigquery_dataset.autozone_dataset.dataset_id
  table_id   = var.table_id #"poc2_Table"
  deletion_protection = false
  schema     = jsonencode([
    {
      name = "Table_Name"
      type = "STRING"
      mode = "REQUIRED"
    },
    {
      name = "Source_Count"
      type = "INTEGER"
      mode = "REQUIRED"
    },
    {
      name = "Destination_Count"
      type = "INTEGER"
      mode = "REQUIRED"
    },
    {
      name = "Status"
      type = "STRING"
      mode = "REQUIRED"
    },
    {
      name = "Validation_Date"
      type = "TIMESTAMP"
      mode = "REQUIRED"
    }
  ])
}
