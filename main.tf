#Add variable for cloud API token
variable "hcloud_token" {}
variable "home_ip" {}

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


module "firewall_redm"  {
  source = "/opt/terraform/module/firewall_redm"
  firewall_name = "redm_firewall"
  home_ip = var.home_ip
  hcloud_token  = var.hcloud_token
}
  

# Creating the Rocky Linux server
resource "hcloud_server" "redm01" {
  name        = "USWEST-REDM01"
  image       = "rocky-9"
  server_type = "cpx31"
  location = "hil"
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  firewall_ids = [module.firewall_redm.firewall_id]
  ssh_keys = [11104353]
}

#Firewall creation and rules



#resource "hcloud_firewall" "redm_firewall" {
#   name = "RedMServer"
#   rule {
#     direction = "in"
#     protocol  = "tcp"
#     port = "22"
#     source_ips = [
#       var.home_ip
#     ]
#   }
# 
# 
#   rule {
#     direction = "in"
#     protocol = "tcp"
#     port  = "40120"
#     source_ips = [
#       var.home_ip
#     ]
#   }
# 
#   rule {
#     direction = "in"
#     protocol  = "tcp"
#     port      = "30120"
#     source_ips = [
#       "0.0.0.0/0",
#       "::/0"
#     ]
#   }
# 
#   rule {
#     direction = "in"
#     protocol  = "udp"
#     port      = "30120"
#     source_ips = [
#       "0.0.0.0/0",
#       "::/0"
#     ]
#   }
# 
# 
#}


