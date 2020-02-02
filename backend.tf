terraform {
  backend "gcs" {
    bucket = "turma03-infraagil-260822-tfstate"
    credentials = "../turma03-infraagil-260822-7250df45ed5f.json"
  }
}
