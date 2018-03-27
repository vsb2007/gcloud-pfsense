resource "google_compute_network" "mynetwork" {
  name = "${var.network-name}"

  #name                    = "default"
  auto_create_subnetworks = "false"

  #ipv4_gateway = "true"
  #gateway_address = "10.2.0.254"
}

resource "google_compute_subnetwork" "my-subnetwork-1" {
  name          = "test-subnet-1"
  ip_cidr_range = "${var.network}"
  network       = "${google_compute_network.mynetwork.self_link}"

  #private_ip_google_access = true
}

#resource "google_compute_network" "mynetwork2" {
#  name = "${var.network-name2}"
#
#  #name                    = "default"
#  auto_create_subnetworks = "false"
#}
#
#resource "google_compute_subnetwork" "my-subnetwork-2" {
#  name          = "test-subnet-2"
#  ip_cidr_range = "${var.network2}"
#  network       = "${google_compute_network.mynetwork2.self_link}"
#}

resource "google_compute_route" "mydefault" {
  name        = "network-route"
  dest_range  = "10.3.0.0/24"
  network     = "${google_compute_network.mynetwork.name}"
  next_hop_ip = "10.2.0.253"
  priority    = 100
}

resource "google_compute_firewall" "firewall_ssh" {
  name    = "my-allow-ssh"
  network = "${google_compute_network.mynetwork.name}"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "firewall_http" {
  name    = "my-allow-http"
  network = "${google_compute_network.mynetwork.name}"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "icmp" {
  name    = "my-allow-icmp"
  network = "${google_compute_network.mynetwork.name}"

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "myopenvpn" {
  name    = "my-allow-openvpn2"
  network = "${google_compute_network.mynetwork.name}"

  allow {
    protocol = "udp"
    ports    = ["1194"]
  }

  source_ranges = ["0.0.0.0/0"]
}
