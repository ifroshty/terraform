variable "server_redm_ip" {} 
variable "hcloud_token" {}
variable "home_ip" {} 
variable "server_redm_priv_ip" {}

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

# Create the private network
resource "hcloud_network" "staging" {
  name     = "staging"
  ip_range = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "redm" {
  network_id   = hcloud_network.staging.id
  type         = "cloud"
  network_zone = "us-west"
  ip_range     = "10.0.1.0/24"
}


#Firewall Creation Module for RedM
module "firewall_redm"  {
  source = "/opt/terraform/staging/modules/firewall_redm"
  firewall_name = "firewall_redm"
  home_ip = var.home_ip
  hcloud_token  = var.hcloud_token
  private_network_id = hcloud_network.staging.id
}


#Firewall Creation Module for mySQL DB Hive
module "firewall_mysql"  {
  source = "/opt/terraform/staging/modules/firewall_mysql"
  firewall_mysql_name = "firewall_mysql"
  home_ip = var.home_ip
  server_redm_priv_ip = var.server_redm_priv_ip
  hcloud_token  = var.hcloud_token
  private_network_id = hcloud_network.staging.id
}

  

# Creating the Rocky Linux Game Server
module "server_game" {
  source       = "/opt/terraform/staging/modules/server_game"
  server_name    = "USWEST-STG-REDM01"
  image          = "rocky-9"
  server_type    = "cpx31"
  location       = "hil"
  firewall_ids   = [module.firewall_redm.firewall_id]
  ipv4_address   = "31273573"
  hcloud_token   = var.hcloud_token
  ssh_keys       = ["11104353"]
  private_network_id = hcloud_network.staging.id
  internal_ip     = "10.0.1.10"
}

# Creating the Rocky Linux mySQL Hive Server
module "server_mysql" {
  source       = "/opt/terraform/staging/modules/server_mysql"
  server_name  = "USWEST-STG-HIVE-DB01"
  image        = "rocky-9"
  server_type  = "cpx31"
  location     = "hil"
  hcloud_token = var.hcloud_token
  ssh_keys     = ["11104353"]
  firewall_ids = [module.firewall_mysql.firewall_id]
  private_network_id = hcloud_network.staging.id
  internal_ip   = "10.0.1.20"
}


