provider "google" {
  credentials = "${file("./creds/service-account.json")}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}

provider "google-beta" {
  credentials = "${file("./creds/service-account.json")}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}

provider "kubernetes" {
  load_config_file = false

  host                   = "https://${data.google_container_cluster.gke_cluster.endpoint}"
  token                  = "${data.google_client_config.default.access_token}"
  cluster_ca_certificate = "${base64decode(data.google_container_cluster.gke_cluster.master_auth.0.cluster_ca_certificate)}"
  # insecure = true
}

