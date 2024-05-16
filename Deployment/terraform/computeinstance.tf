resource "google_compute_instance" "webapp_instance" {
  count        = var.var_count
  name         = "${var.app_name}-instance-${count.index}"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.machine_image
      size  = var.size
    }
  }

  network_interface {
    network    = google_compute_network.vpc[count.index].id
    subnetwork = google_compute_subnetwork.webapp[count.index].id
    access_config {}
  }

  tags = ["webapp-instance", "http-server"]
    metadata_startup_script = <<-SCRIPT
    #!/bin/bash

    PUBLIC_IP_ADDRESS=$(curl -s ifconfig.co)
    touch /tmp/.env
    echo "PUBLIC_IP_ADDRESS=$PUBLIC_IP_ADDRESS" >> /tmp/.env
    echo "REACT_APP_BASE_URL=http://$PUBLIC_IP_ADDRESS:3000" >> /tmp/.env
    # sudo rm /tmp/webapp/ArtCircle/.env
    sudo cp /tmp/.env /tmp/webapp/ArtCircle/.env
    sudo chown artCircle:artCircle /tmp/webapp/ArtCircle/.env
    sudo systemctl restart artcircle_backend.service
    sudo systemctl restart artcircle_frontend.service
  SCRIPT
}
