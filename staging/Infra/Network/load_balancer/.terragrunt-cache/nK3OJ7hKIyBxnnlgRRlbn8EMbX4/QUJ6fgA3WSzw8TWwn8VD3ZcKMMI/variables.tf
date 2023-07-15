variable "lb_name" {
  type        = string
  description = "The name of the lb"
}

variable "lb_type" {
  type        = string
  description = "lb type"
}

variable "lb_location" {
  type        = string
  description = "lb location"
}

variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
}

variable "lb_ip" {
  description = "The IP address for the load balancer"
  type        = string
}

variable "network_id" {
  description = "The network ID for the load balancer"
  type        = string
}

variable "lb_protocols" {
  type        = list(string)
  description = "List of protocols for the load balancer services"
  default     = ["http"]
}
