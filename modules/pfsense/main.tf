#resource "google_compute_instance" "instance-pfsense" {
#  name         = "pfsense"
#  machine_type = "g1-small"
#  zone         = "europe-west4-b"
#  tags         = ["pfsense"]
#
#  boot_disk {
#    initialize_params {
#      image = "${var.img}"
#      size = "30"
#    }
#  }
#
#  network_interface {
#    subnetwork = "${var.subnetwork-name2}"
#    access_config = {
#	nat_ip = "${google_compute_address.pfsense_static_ip.address}"
#    }
#    #address = "10.2.0.253"
#  }
#  network_interface {
#    subnetwork = "${var.subnetwork-name}"
#    #subnetwork = "test-subnet-1"
#    #network = "test-subnet"
#    #network = "default"
##    access_config = {
##	nat_ip = "${google_compute_address.pfsense_static_ip.address}"
##    }
#    address = "10.2.0.253"
#  }
#
#  can_ip_forward = true
#  metadata {
#    sshKeys = "${var.public_key_user}:${file(var.public_key_path)}"
#  }
#
#}

#resource "google_compute_disk" "blog" {
#    name  = "blog"
#    type  = "pd-ssd"
#    zone  = "us-west1-a"
#    snapshot = "blog-2017-02-08-1"
#    size = 10
#}
#resource "google_compute_snapshot" "my-snapshot" {
#  name        = "pfsense-image-1"
#  source_disk = "disk-1"
#  zone        = "europe-west4-b"
#
#  labels {
#    my-label = "my-label-value"
#  }
#}
#
#resource "google_compute_disk" "pfsense-disk" {
#    name  = "pfsense-235-disk"
#    type  = "pd-ssd"
#    zone  = "europe-west4-b"
#    snapshot = "${google_compute_snapshot.my-snapshot.self_link}"
#    size = 30
#}

resource "google_compute_instance" "instance-pfsense" {
  name         = "pfsense"
  machine_type = "g1-small"
  zone         = "europe-west4-b"
  tags         = ["pfsense"]

  # depends_on = ["google_compute_snapshot.my-snapshot"]

  boot_disk {
    #source = "${google_compute_disk.pfsense-disk.self_link}"
    initialize_params {
      image = "pfsense-image-1-working"

      #size = "30"
    }
  }
  #  boot_disk {
  #    disk = "${google_compute_disk.pfsense-disk.name}"
  #    auto_delete = true
  # 
  ##    initialize_params {
  ##      image = "${google_compute_snapshot.my-snapshot.name}"
  ##      size = "30"
  ##    }
  #  }
  #  network_interface {
  #    subnetwork = "${var.subnetwork-name2}"
  #    #subnetwork = "test-subnet-1"
  #    #network = "test-subnet"
  #    #network = "default"
  #    access_config = {
  #    nat_ip = "${google_compute_address.pfsense_static_ip.address}"
  #    }
  #    #address = "10.2.0.253"
  #  }
  network_interface {
    subnetwork = "${var.subnetwork-name}"

    #subnetwork = "test-subnet-1"
    #network = "test-subnet"
    #network = "default"
    access_config = {
      nat_ip = "${google_compute_address.pfsense_static_ip.address}"
    }

    address = "10.2.0.253"
  }
  can_ip_forward = true
  metadata {
    sshKeys = "${var.public_key_user}:${file(var.public_key_path)}"
  }
}

resource "google_compute_address" "pfsense_static_ip" {
  name   = "pfsence-static-ip"
  region = "europe-west4"
}
