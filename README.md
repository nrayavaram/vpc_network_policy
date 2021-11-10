# vpc_network

This module makes it easy to set up a new VPC Network in GCP by defining your network and MTU ranges in a concise syntax.

It supports creating:

A Google Virtual Private Network (VPC)
Subnets within the VPC
Secondary ranges for the subnets (if applicable)
Sub modules are provided for creating individual vpc, subnets, and routes. See the modules directory for the various sub modules usage.

Compatibility


Usage
You can go to the examples folder, however the usage of the module could be like this in your own main.tf file:

provider "google" {
  access_token = var.access_token
  project      = "manifest-access-320809"
}

resource "google_compute_network" "vpc_network" {
#  project                 = "my-project-name"
  name                    = "vpc-network"
  auto_create_subnetworks = true
  mtu                     = 1500
}

resource "google_compute_network" "vpc_network_1" {
#  project                 = "my-project-name"
  name                    = "vpc-network"
  auto_create_subnetworks = true

}


Then perform the following commands on the root folder:

terraform init to get the plugins
terraform plan to see the infrastructure plan
terraform apply to apply the infrastructure build
terraform destroy to destroy the built infrastructure


Inputs:
-----------
Name	Description	Type	Default	Required
auto_create_subnetworks	When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources.	bool	false	no
delete_default_internet_gateway_routes	If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted	bool	false	no
description	An optional description of this resource. The resource must be recreated to modify this field.	string	""	no
firewall_rules	List of firewall rules	any	[]	no
mtu	The network MTU. Must be a value between 1460 and 1500 inclusive. If set to 0 (meaning MTU is unset), the network will default to 1460 automatically.	number	0	no
network_name	The name of the network being created	any	n/a	yes
