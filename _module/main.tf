resource "google_compute_firewall" "ingress-rules" {
  count = length(var.ingress-rules)

  name      = "ig-${element(var.ingress-rules, count.index)["name"]}"
  project   = "travelco-firewall-automation"
  direction = "INGRESS"
  network   = "default"
  allow {
    protocol = element(var.ingress-rules, count.index)["protocol"]
    ports    = element(var.ingress-rules, count.index)["ports"]
  }

  target_service_accounts = lookup(element(var.ingress-rules, count.index), "target-svcs", [])
  source_ranges = lookup(element(var.ingress-rules, count.index), "source-ranges", [])

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}
resource "google_compute_firewall" "egress-rules" {
  count = length(var.egress-rules)

  name      = "ig-${element(var.ingress-rules, count.index)["name"]}"
  project   = "travelco-firewall-automation"
  direction = "EGRESS"
  network   = "default"
  allow {
    protocol = element(var.ingress-rules, count.index)["protocol"]
    ports    = element(var.ingress-rules, count.index)["ports"]
  }

  target_service_accounts = lookup(element(var.ingress-rules, count.index), "target-svcs", [])
  source_ranges = lookup(element(var.ingress-rules, count.index), "source-ranges", [])

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}


output "map" {
  value = var.ingress-rules
}
