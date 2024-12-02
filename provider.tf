provider "google" {
  project     = "terraform-harsha"
  credentials = file("credentials.json")
  region      = var.region
  zone        = "asia-south1-a"
}