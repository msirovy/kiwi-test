resource "google_container_cluster" "gcp_kubernetes" {
  name                = "${var.cluster_name}"
  zone                = "${var.zone}"
  initial_node_count  = "${var.gcp_cluster_nodes}"
  cluster_ipv4_cidr   = "${var.cluster_ipv4_cidr}"
  additional_zones    = "${var.additional_zones}"
  min_master_version  = "1.9.7-gke.6"
  node_version        = "1.9.7-gke.6"

  master_auth {
    username = "${var.linux_admin_username}"
    password = "${var.linux_admin_password}}"
  }

  addons_config {
    #http_load_balancing {
    #  disabled = false
    #}

    #horizontal_pod_autoscaling {
    #  disabled = false
    #}

    kubernetes_dashboard {
      disabled = false
    }
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels  = "${var.labels}"
    tags    = [
      "${var.cluster_name}",
    ]
    disk_size_gb  = "15" 
    #machine_type = "${var.gke_node_machine_type}"
  }
}

# gcloud compute disks create --size=10GB --zone='us-east1-d' ghost-pv-1
resource "google_compute_disk" "ghost-pv-1" {
  name  = "ghost-pv-1"
  type  = "pd-ssd"
  zone  = "europe-west3-a"
  labels {
    environment = "hr-sirovy"
  }
}