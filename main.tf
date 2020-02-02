# Cria uma VM no Google Cloud
resource "google_compute_instance" "wordpressgcp" {
  name         = "wordpressgcp"
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

  #Conexão SSH para validar Conectividade
  provisioner "remote-exec" {
    inline = ["echo 'Liberado para o Ansible'"]

    connection {
      type        = "ssh"
      user        = "cezar.leandro25"
      private_key = file("../id_rsa")
      host        = google_compute_instance.wordpressgcp.network_interface.0.access_config.0.nat_ip
      timeout     = "90s"
    }
  }


  # Cria o inventário do Ansible
  provisioner "local-exec" {
    command = "echo ${google_compute_instance.wordpressgcp.network_interface.0.access_config.0.nat_ip} > ansible/inventory"
  }

  # Executa a playbook na máquina provisionada
  provisioner "local-exec" {
    command = "ansible-playbook -i ansible/inventory --private-key ../id_rsa"
 }

}

## Cria SQL Gerenciado com Engine MySQL 
#resource "google_sql_database_instance" "helloworld" {
#  name             = "database"
#  database_version = var.mysql
#  region           = var.region
#
#  settings {
#    tier = var.dbtype
# }
#}

