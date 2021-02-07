output "endpoint" {
  description = "The IP address of the cluster master."
  sensitive   = true
  value = google_container_cluster.primary.endpoint
}

output "endpoint2" {
  description = "The IP address of the cluster master."
  sensitive   = false
  value = google_container_cluster.primary.endpoint
}

output "master_version" {
  description = "The Master Version."
  sensitive   = false
  value = google_container_cluster.primary.master_version
}
