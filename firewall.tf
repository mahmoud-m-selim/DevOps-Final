resource "google_compute_firewall" "allowssh" {
  depends_on    = [module.network]
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["slave"]

  name    = "allowssh"
  network = module.network.vpc_name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  allow {
    protocol = "icmp"
  }
}
