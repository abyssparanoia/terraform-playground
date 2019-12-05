provider "google" {
  credentials = "${file("./serviceAccount.json")}"
  project     = "${lookup(var.project_name, "${terraform.workspace}")}"
  region      = "asia-northeast1"
}
