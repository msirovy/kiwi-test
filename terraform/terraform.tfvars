# configure your cluster here
gcp_cluster_nodes = 3 
cluster_name = "hr-sirovy"
zone = "europe-west3"
additional_zones = [
    "europe-west3-a"
]
cluster_ipv4_cidr = "10.11.0.0/16"
linux_admin_username = "marek.sirovy"
linux_admin_password = "jelenoviPivonelej:-P"       # Dirty and stupid but don't have backend for this right now
labels = {
    Name = "hr-sirovy"
    Env  = "hr-test"
    Description = "K8s_cluster_for_testing"
    Author = "marek.sirovy"
}
sql_instance_size = "db-g1-small"
# testing user
sql_admin_user = "marek.sirovy"
sql_admin_pass = "5yhbwil8onklmpo3qlknjd-k"         # Dirty and stupid but don't have backend for this right now

sql_ghost_user = "ghost"
sql_ghost_pass = "G6d-yubjwkevin4dausklnB!YUKndQ"   # Dirty and stupid but don't have backend for this right now