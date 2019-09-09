resource "google_container_cluster" "primary" {
  provider           = "google-beta"
  name               = "default-cluster"
  network            = "default"
  location           = "australia-southeast1"
  initial_node_count = 1

  addons_config {
    http_load_balancing {
      disabled = false
    }

    horizontal_pod_autoscaling {
      disabled = false
    }

    kubernetes_dashboard {
      disabled = true
    }
  }

  workload_identity_config {
    identity_namespace = "gke-terraform-cluster-demo.svc.id.goog"
  }

  enable_binary_authorization = true
}

data "google_client_config" "default" {}

data "google_container_cluster" "gke_cluster" {
  name     = "${google_container_cluster.primary.name}"
  location = "australia-southeast1"
}
