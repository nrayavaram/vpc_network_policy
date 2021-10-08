provider "google" {
  access_token = var.access_token
  project      = "manifest-access-320809"
}

resource "google_compute_network" "vpc_network" {
#  project                 = "my-project-name"
  name                    = "vpc-network"
  auto_create_subnetworks = true
  mtu                     = 1460
}
