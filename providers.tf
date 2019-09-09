provider "google-beta" {
  credentials = "${file("../creds/gke-terraform-cluster-demo-60247ac71872.json")}"
  project     = "gke-terraform-cluster-demo"
  region      = "australia-southeast1"
}
