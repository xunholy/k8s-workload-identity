# GKE Service Account
resource "kubernetes_service_account" "gke-sa" {
  metadata {
    name      = "gke-sa"
    namespace = "workload-identity"
    annotations = {
      "iam.gke.io/gcp-service-account" = "${google_service_account.gcp-sa.account_id}@gke-terraform-cluster-demo.iam.gserviceaccount.com"
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
