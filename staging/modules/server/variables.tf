variable "server_name" {
  type        = string
  description = "The name of the server"
}

variable "image" {
  type        = string
  description = "Image distro of the server"
}

variable "server_type" {
  type        = string
  description = "Server type"
}

variable "location" {
  type        = string
  description = "Which Datacenter"
}

variable "ssh_keys" {
  type        = list(number)
  description = "ID(s) of SSH key"
}

variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
}

variable "firewall_ids" {
  type        = list(string)
  description = "Firewall for the server"
}

variable "ipv4_address" {
  type       = string
  description = "Assign already created IPv4 address"
}

variable "private_network_id" {
  type        = string
  description = "private network id"
}

variable "internal_ip" {
  type        = string
  description = "subnet ip"
}
