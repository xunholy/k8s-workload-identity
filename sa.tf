# GKE Service Account
resource "kubernetes_service_account" "gke-sa" {
  metadata {
    name      = "${var.k8s-service-account}"
    namespace = "${var.k8s-namespace}"
    annotations = {
      "iam.gke.io/gcp-service-account" = "${google_service_account.gcp-sa.account_id}@${var.project_id}.iam.gserviceaccount.com"
    }
  }
  secret {
    name = "${kubernetes_secret.example.metadata.0.name}"
  }
}

# GKE Service Account Secret
resource "kubernetes_secret" "example" {
  metadata {
    name = "secret-example"
  }
}

# GCP Service Account
resource "google_service_account" "gcp-sa" {
  account_id   = "gcp-sa"
  display_name = "GCP service account used in GKE"
}
