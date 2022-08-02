resource "google_compute_address" "natips" {
  name = "natips"
  project = var.project
  region  = var.region
}


resource "google_compute_router_nat" "mynat" {
  name                               = "mynat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "MANUAL_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ips = [ google_compute_address.natips.self_link ]

  subnetwork {
    name                    = google_compute_subnetwork.mypublicsubnet.id
    source_ip_ranges_to_nat = [var.public_subnet_cidr]
  }

  subnetwork { 
     name = google_compute_subnetwork.myprivatesubnet.id
     source_ip_ranges_to_nat = [ var.private_subnet_cidr ]
  }
}