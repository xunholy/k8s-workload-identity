resource "google_container_cluster" "primary" {
  provider           = "google-beta"
  name               = "${var.cluster_name}"
  network            = "default"
  location           = "${var.location}"
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
    identity_namespace = "${var.project_id}.svc.id.goog"
  }

  enable_binary_authorization = true
}
