terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.41.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}


# Create the private network
resource "hcloud_network" "network" {
  name     = var.ip_name
  ip_range = var.ip_range
}

resource "hcloud_network_subnet" "subnet" {
  network_id   = hcloud_network.network.id
  type         = var.type
  network_zone = var.network_zone
  ip_range     = var.sub_ip_range
}