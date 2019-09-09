# GCP Service Account Binding
data "google_iam_policy" "workload-identity-sa-binding" {
  binding {
    role = "roles/iam.workloadIdentityUser"
    members = [
      "serviceAccount:gke-terraform-cluster-demo.svc.id.goog[workload-identity/gke-sa]",
    ]
  }
}

# GCP Service Account IAM Policy
resource "google_service_account_iam_policy" "workload-identity-sa-iam" {
  service_account_id = "${google_service_account.gcp-sa.name}"
  policy_data        = "${data.google_iam_policy.workload-identity-sa-binding.policy_data}"
}
