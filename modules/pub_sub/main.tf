resource "google_pubsub_topic" "autozone_topic" {
  name = var.topic_name  #"autozone-topic"
  project    = var.project_id
}
# Add this output
output "autozone_topic_name" {
  value = google_pubsub_topic.autozone_topic.name
}
