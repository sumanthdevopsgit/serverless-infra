module "database_migration" {
  source            = "./modules/database_migration"
  environment       = var.environment
  project_id        = var.project_id
  source_username   = var.source_username
  source_password   = var.source_password
  source_host       = var.source_host
  region            = var.region
  sql_user_name     = var.sql_user_name
  sql_user_password = var.sql_user_password
}
module "bigquery" {
  source     = "./modules/bigquery"
  project_id = var.project_id
  region     = var.region
  dataset_id = var.dataset_id
  table_id   = var.table_id
}

module "pubsub" {
  source     = "./modules/pubsub"
  project_id = var.project_id
  topic_name = var.topic_name
}

module "scheduler" {
  source              = "./modules/scheduler"
  project_id          = var.project_id
  topic_name          = module.pubsub.autozone_topic_name
  scheduler_frequency = var.scheduler_frequency
  job_name            = var.job_name #"autozone-scheduler-job"
  time_zone           = var.time_zone
}
# To start the function automatically.
# resource "null_resource" "trigger_scheduler_job" {
#   provisioner "local-exec" {
#     command = "gcloud scheduler jobs run ${module.scheduler.job_name} --location=${var.region}"
#   }

#   # Ensure this runs after the scheduler job is created
#   depends_on = [module.scheduler]
# }

module "cloud_function" {
  source                = "./modules/cloud_function"
  project_id            = var.project_id
  region                = var.region
  service_account_email = var.service_account_email
  bucket_name           = var.bucket_name
  source_path           = var.source_path
  topic_name            = module.pubsub.autozone_topic_name
  function_name         = var.function_name
  force_destroy         = var.force_destroy
}
