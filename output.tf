# Retorna o IP da VM criada
output "IP_da_VM" {
  value = "${google_compute_instance.wordpressgcp.network_interface.0.access_config.0.nat_ip}"
}

