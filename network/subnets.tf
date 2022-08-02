resource "google_compute_subnetwork" "mypublicsubnet" {
  name          = "mypublicsubnet"
  ip_cidr_range = var.public_subnet_cidr
  region        = var.region
  private_ip_google_access = true
  network       = google_compute_network.myvpc.id
}

resource "google_compute_subnetwork" "myprivatesubnet" {
  name          = "myprivatesubnet"
  ip_cidr_range = var.private_subnet_cidr
  region        = var.region
  private_ip_google_access = true
  network       = google_compute_network.myvpc.id
}