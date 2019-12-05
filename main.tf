provider "google" {
  credentials = "${file("${var.credential.data}")}"
  project     = "${lookup(var.project_name, "${terraform.workspace}")}"
  region      = "asia-northeast1"
}

resource "google_app_engine_application" "app" {
  project     = "${lookup(var.project_name, "${terraform.workspace}")}"
  location_id = "${lookup(var.location, "${terraform.workspace}")}"
}

resource "google_sql_database_instance" "master" {
  name             = "master-instance"
  database_version = "POSTGRES_9_6"
  region           = "${lookup(var.location, "${terraform.workspace}")}"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_storage_bucket" "contents" {
  name     = "develop-rabee-contents"
  location = "${lookup(var.location, "${terraform.workspace}")}"
}
