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
