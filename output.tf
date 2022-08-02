output "ssh" {
  description = "GCloud command to connect to the bastion server."
  value       = "gcloud compute ssh ${google_compute_instance.bastion.name} --project ${var.project} --zone ${google_compute_instance.bastion.zone} -- -L8888:127.0.0.1:8888"
}