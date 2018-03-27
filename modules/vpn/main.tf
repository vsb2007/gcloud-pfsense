resource "google_compute_vpn_gateway" "target_gateway" {
  name    = "vpn1"
  network = "${var.network}.self_link"
  region  = "${var.subnetwork}.region"
}

resource "google_compute_address" "vpn_static_ip" {
  name = "vpn-static-ip"
}

resource "google_compute_forwarding_rule" "fr_esp" {
  name        = "fr-esp"
  ip_protocol = "ESP"
  ip_address  = "${google_compute_address.vpn_static_ip.address}"
  target      = "${google_compute_vpn_gateway.target_gateway.self_link}"
}
