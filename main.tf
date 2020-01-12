# Cria uma VM no Google Cloud
resource "google_compute_instance" "helloworld" {
  name         = "estagiario"
  machine_type = var.machine_type
  zone         = var.zone

  # Defini a Imagem da VM
  boot_disk {
    initialize_params {
      image = var.linux
    }
  }

  # Habilita rede para a VM com um IP público
  network_interface {
    network = "default"
    access_config {
    }
  }
}

# Cria SQL Gerenciado com Engine MySQL 
resource "google_sql_database_instance" "helloworld" {
  name             = "database"
  database_version = var.mysql
  region           = var.region

  settings {
    tier = var.dbtype
}
}

