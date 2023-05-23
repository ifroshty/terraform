terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
}



resource "hcloud_network" "redm" {
  name     = "redm"
  ip_range = "10.0.0.0/16"
}

resource "hcloud_server" "server" {
  name        = var.name
  image       = var.image
  server_type = var.server_type
  ssh_key     = "Hetzner-Access"
  firewall_ids = "REDM"
  
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}

