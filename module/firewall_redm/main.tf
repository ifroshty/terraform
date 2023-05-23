resource "hcloud_firewall" "redm_firewall" {
  name = var.firewall_name

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "22"
    source_ips  = [
      "72.212.51.3/32"
    ]
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "40120"
    source_ips  = [
      "72.212.51.3/32"
    ]
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "30120"
    source_ips  = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction   = "in"
    protocol    = "udp"
    port        = "30120"
    source_ips  = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

