variable "firewall_name" {
  type        = string
  description = "The name of the firewall"
}

variable "home_ip" {
  type	      = string
  description = "Home IP"
}

variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
}

variable "private_network_id" {
  type        = string
  description = "private network id"
}