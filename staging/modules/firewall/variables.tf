variable "name" {
  description = "Name of the firewall"
}

variable "tcp_rules" {
  description = "List of TCP rules"
  type        = list(object({
    port       = string
    source_ips = list(string)
  }))
}

