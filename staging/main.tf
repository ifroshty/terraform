#Add variable for cloud API token
variable "hcloud_token" {}
variable "home_ip" {}
variable "server_name" {}
variable "image" {}
variable "server_type" {}
variable "location" {}
variable "ssh_keys" {}



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

#Firewall Creation Module
module "firewall_redm"  {
  source = "/opt/terraform/staging/modules/firewall_redm"
  firewall_name = "redm_firewall"
  home_ip = var.home_ip
  hcloud_token  = var.hcloud_token
}
  

# Creating the Rocky Linux server
module "server_game" {
  source       = "/opt/terraform/staging/modules/server_game"
  server_name  = var.server_name
  image        = var.image
  server_type  = var.server_type
  location     = var.location
  hcloud_token = var.hcloud_token
  ssh_keys     = var.ssh_keys
  firewall_ids = [module.firewall_redm.firewall_id]

}

