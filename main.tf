# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A GKE CLUSTER IN GOOGLE CLOUD PLATFORM
# 
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  # To make sure the correct version of Terraform used
  required_version = ">= 0.12.24"
}


# ---------------------------------------------------------------------------------------------------------------------
# CREATE A CLUSTER
# ---------------------------------------------------------------------------------------------------------------------



resource "google_container_cluster" "primary" {
  name        = var.name
  project     = var.project
  description = "Demo GKE Cluster"
  location    = var.location

  initial_node_count = var.initial_node_count
  //network            = "var.vpc_name"
  //subnetwork         = "var.subnet_name"
  
  resource_labels = {
    environment = "testing"
  }
  
  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A NODE POOL
# ---------------------------------------------------------------------------------------------------------------------


resource "google_container_node_pool" "node_pool" {
  name       = "${var.name}-node-pool"
  project    = var.project
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = 1
  
  autoscaling {
    min_node_count = "1"
    max_node_count = "5"
  }

  management {
    auto_repair  = "true"
    auto_upgrade = "true"
  }
  
  node_config {
    image_type   = "COS"
    machine_type = var.machine_type
	disk_size_gb = "30"
    disk_type    = "pd-standard"
    preemptible  = false
	
    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
