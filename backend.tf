terraform {
  backend "gcs" {
    bucket      = "gke-terraform-cluster-demo"
    prefix      = "terraform/state"
    credentials = "../creds/gke-terraform-cluster-demo-60247ac71872.json"
  }
}
