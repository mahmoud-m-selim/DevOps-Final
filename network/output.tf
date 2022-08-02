output "vpc_id" {
  value = google_compute_network.myvpc.id
}

output "vpc_name" {
  value = google_compute_network.myvpc.name
}

output "public_subnet_name" {
  value = google_compute_subnetwork.mypublicsubnet.name
}

output "private_subnet_name" {
  value = google_compute_subnetwork.myprivatesubnet.name
}