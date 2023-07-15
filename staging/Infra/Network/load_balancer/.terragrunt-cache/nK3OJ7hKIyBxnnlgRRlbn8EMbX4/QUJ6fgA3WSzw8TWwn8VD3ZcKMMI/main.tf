terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.41.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_load_balancer" "stg_balancer" {
  name               = var.lb_name
  load_balancer_type = var.lb_type
  location           = var.lb_location
}

resource "hcloud_load_balancer_network" "stg_lb" {
  load_balancer_id = hcloud_load_balancer.stg_balancer.id
  network_id       = var.network_id
  ip               = var.lb_ip
}

resource "hcloud_load_balancer_service" "load_balancer_service" {
  for_each         = toset(var.lb_protocols)
  load_balancer_id = hcloud_load_balancer.stg_balancer.id
  protocol         = each.key
}
