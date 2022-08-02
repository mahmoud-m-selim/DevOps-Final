
resource "google_container_node_pool" "pool" {
  name           = "pool"
  cluster        = google_container_cluster.mycluster.id
  node_count     = 1

  autoscaling {
    max_node_count = 1
    min_node_count = 1
  }
  max_pods_per_node = 10

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = true
    disk_size_gb = 10
    machine_type = "e2-small"

    labels = {
      role = "pool"
  }

  oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform"
  ]

  service_account = google_service_account.kubernetes.email
  }

}