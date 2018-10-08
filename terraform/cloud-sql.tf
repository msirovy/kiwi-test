resource "google_sql_database_instance" "master" {
  name              = "hr-sirovy"
  database_version  = "MYSQL_5_7"
  region            = "${var.zone}"

  settings {
    tier            = "${var.sql_instance_size}"
    disk_type       = "PD_SSD"
    disk_autoresize = true
  
#    ip_configuration {
#      authorized_networks = {
#        value = "${var.cluster_ipv4_cidr}"
#      }
#    } # END ip_configuration
  
    #backup_configuration {
    #  binary_log_enabled = true
    #  enabled            = true
    #  start_time         = "00:00"
    #}
   } # END settings
}

resource "google_sql_user" "admin" {
  depends_on = [
    "google_sql_database_instance.master",
  ]
  instance = "${google_sql_database_instance.master.name}"
  name     = "${var.sql_admin_user}"
  password = "${var.sql_admin_pass}"

}

data "google_service_account" "k8s-sql" {
  account_id = "k8s-sql"
}

# ToDo: rozfungovat, account_id parametr neni spravne
#data "google_iam_policy" "k8s-sql" {
#  binding {
#    role = "roles/cloudsql.clien"
#
#    members = [
#      "${google_service_account.k8s-sql.account_id}",
#    ]
#  }
#}

resource "google_service_account_key" "k8s-sql" {
  service_account_id = "${data.google_service_account.k8s-sql.name}"
}

# ToDo: neprochazi na prvni dobrou, nemam cas ted resit, ale bylo by to paradni 
# (musim rucne pustit gcloud container clusters get-credentials hr-sirovy --zone europe-west3)
resource "kubernetes_secret" "cloudsql-instance-credentials" {
  metadata {
    name = "cloudsql-instance-credentials"
  }
  data {
    credentials.json = "${base64decode(google_service_account_key.k8s-sql.private_key)}"
  }
}

resource "kubernetes_secret" "cluster-db-password" {
  metadata {
    name = "clustersql-password"
  }

  data {
    username="${var.sql_admin_user}"
    password="${var.sql_admin_pass}"
  }
}
