# GCP Service Account IAM Policy
resource "google_service_account_iam_policy" "workload-identity-sa-iam" {
  service_account_id = "${google_service_account.gcp-sa.name}"
  policy_data        = "${data.google_iam_policy.workload-identity-sa-binding.policy_data}"
}
