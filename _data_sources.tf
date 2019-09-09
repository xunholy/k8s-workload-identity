# GCP Service Account Binding
data "google_iam_policy" "workload-identity-sa-binding" {
  binding {
    role = "roles/iam.workloadIdentityUser"
    members = [
      "serviceAccount:${var.project_id}.svc.id.goog[${var.k8s-namespace}/${var.k8s-service-account}]",
    ]
  }
}

data "google_client_config" "default" {}

data "google_container_cluster" "gke_cluster" {
  name     = "${google_container_cluster.primary.name}"
  location = "${var.location}"
}
