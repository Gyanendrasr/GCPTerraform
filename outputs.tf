output "endpoint" {
  description = "The IP address of the cluster master."
  sensitive   = true
  value = google_container_cluster.default.endpoint
}

output "endpoint2" {
  description = "The IP address of the cluster master."
  sensitive   = false
  value = google_container_cluster.default.endpoint
}

output "master_version" {
  description = "The Master Version."
  sensitive   = false
  value = google_container_cluster.default.master_version
}