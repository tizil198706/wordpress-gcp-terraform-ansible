# Configura o Provider Google Cloud com o Projeto
provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}
