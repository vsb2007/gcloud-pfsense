provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

module "network" {
  source = "modules/network"
}

module "instances" {
  source          = "modules/instances"
  subnetwork-name = "${module.network.subnetwork-name}"

  img = "field-base-1521539654"

  public_key_path = "~/.ssh/appuser.pub"
  public_key_user = "appuser"
}

module "pfsense" {
  source           = "modules/pfsense"
  subnetwork-name  = "${module.network.subnetwork-name}"

  img = "pfsense"

  public_key_path = "~/.ssh/appuser.pub"
  public_key_user = "appuser"
}


