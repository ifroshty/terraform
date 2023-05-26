terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.39.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_server" "gameserver" {
  name        = var.server_name
  image       = var.image
  server_type = var.server_type
  location    = var.location

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  firewall_ids = var.firewall_ids
  ssh_keys     = var.ssh_keys
}

