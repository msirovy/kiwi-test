# configure your cluster here
gcp_cluster_nodes = 3 
cluster_name = "hr-sirovy"
zone = "europe-west3"
additional_zones = [
    "europe-west3-a"
]
cluster_ipv4_cidr = "10.11.0.0/16"
linux_admin_username = "marek.sirovy"
linux_admin_password = "jelenoviPivonelej:-P"
labels = {
    Name = "hr-sirovy"
    Env  = "hr-test"
    Description = "K8s_cluster_for_testing"
    Author = "marek.sirovy"
}
