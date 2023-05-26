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

resource "hcloud_firewall" "mysql_firewall" {
  name = var.firewall_mysql_name

  rule {
    direction       = "in"
    protocol        = "tcp"
    port            = "22"
    source_ips      = [var.home_ip]
    destination_ips = []  # Allow any destination IP
  }

  rule {
    direction       = "in"
    protocol        = "tcp"
    port            = "3306"
    source_ips      = ["10.0.1.20/32"] 
    destination_ips = [var.server_redm_priv_ip]  
  }

  rule {
    direction       = "out"
    protocol        = "tcp"
    port            = "3306"
    source_ips      = ["10.0.1.20/32"] 
    destination_ips = [var.server_redm_priv_ip]  
  }
}


