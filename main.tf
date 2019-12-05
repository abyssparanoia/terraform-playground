variable "project_name" {
  default = {
    tf-sample = "develop-sugimoto-rabee-jp"
  }
}

variable "location" {
  default = {
    tokyo = "asia-northeast1"
  }
}

variable "credential" {
  default = {
    data = "./serviceAccount.json"
  }
}


provider "google" {
  credentials = var.credential.data
  project     = var.project_name.tf-sample
  region      = var.location.tokyo
}

resource "google_app_engine_application" "app" {
  project     = var.project_name.tf-sample
  location_id = var.location.tokyo
}

resource "google_sql_database_instance" "master" {
  name             = "master-instance"
  database_version = "POSTGRES_9_6"
  region           = var.location.tokyo

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_storage_bucket" "contents" {
  name     = "develop-rabee-contents"
  location = var.location.tokyo
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.contents.name
  role   = "READER"
  entity = "allUsers"
}
