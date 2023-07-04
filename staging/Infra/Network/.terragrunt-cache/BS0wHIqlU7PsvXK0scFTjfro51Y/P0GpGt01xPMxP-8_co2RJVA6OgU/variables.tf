variable "ip_name" {
  type        = string
  description = "Name of IP"
}

variable "ip_range" {
  type        = string
  description = "Range of IP"
}

variable "type" {
  type        = string
  description = "typeof network"
}

variable "network_zone" {
  type        = string
  description = "which az"
}

variable "sub_ip_range" {
  type        = string
  description = "Range of subnet IPs"
}

variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
}