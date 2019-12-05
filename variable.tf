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
