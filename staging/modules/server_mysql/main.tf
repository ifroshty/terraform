terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.39.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_server" "mysql" {
  name         = var.server_name
  image        = var.image
  server_type  = var.server_type
  location     = var.location
  firewall_ids = var.firewall_ids
  ssh_keys     = var.ssh_keys

  public_net {
    ipv4_enabled = false
    ipv6_enabled = true
  }

  network {
    network_id = var.private_network_id
    ip         = var.internal_ip 
  }
}


