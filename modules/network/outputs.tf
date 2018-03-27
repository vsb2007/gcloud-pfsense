output "network-name" {
  value = "${google_compute_network.mynetwork.name}"
}

output "network" {
  value = "${google_compute_network.mynetwork.self_link}"
}

output "subnetwork-range" {
  value = "${google_compute_subnetwork.my-subnetwork-1.ip_cidr_range}"
}

output "subnetwork-name" {
  value = "${google_compute_subnetwork.my-subnetwork-1.name}"
}

output "subnetwork" {
  value = "${google_compute_subnetwork.my-subnetwork-1.self_link}"
}

#output "vpn_ip" {
#  value = "${google_compute_address.vpn_static_ip.address}"
#}

