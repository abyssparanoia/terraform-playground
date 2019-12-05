variable "project_name" {
  default = {
    tf-sample = "develop-sugimoto-rabee-jp"
  }
}

variable "credential" {
  default = {
    data = "./serviceAccount.json"
  }
}
