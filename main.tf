provider "google" {
  credentials = "${file("${var.credential.data}")}"
  project     = "${lookup(var.project_name, "${terraform.workspace}")}"
  region      = "asia-northeast1"
}
