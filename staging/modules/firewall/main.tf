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

resource "hcloud_firewall" "myfirewall" {
  name = var.name

  dynamic "rule" {
    for_each = var.tcp_rules
    content {
      direction  = "in"
      protocol   = "tcp"
      port       = rule.value.port
      source_ips = rule.value.source_ips
    }
  }
}


