resource "google_compute_instance" "instance-1" {
  name         = "ubuntu-test"
  machine_type = "g1-small"
  zone         = "europe-west4-b"
  tags         = ["ubuntu-test"]

  boot_disk {
    initialize_params {
      image = "${var.img}"
    }
  }

  network_interface {
    subnetwork = "${var.subnetwork-name}"

    #access_config = {
    #}
    address = "10.2.0.2"
  }

  can_ip_forward = true

  metadata {
    sshKeys = "${var.public_key_user}:${file(var.public_key_path)}"
  }
}
