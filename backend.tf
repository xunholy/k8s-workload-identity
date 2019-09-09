terraform {
  backend "gcs" {
    bucket      = "gke-terraform-cluster-demo"
    prefix      = "terraform/state"
    credentials = "./creds/service-account.json"
  }
}
