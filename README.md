KIWI vstupni uloha
==================

**!!!  write everything in terraform / Dockerfile / manifest / bash files !!!!**


GCP project (You will get access)
---------------------------------

Instalace u me:

curl https://sdk.cloud.google.com | bash
gcloud init
gcloud components install kubectl      #instalace posledni verze



use terraform to deploy k8s cluster (3 nodes), cloudSQL (setup firewall)
------------------------------------------------------------------------
- prepare structure of my git kiwi-test
- create service account terraform in gce with edit perrmission for all (just this time)
- export key for terraform and prepare connection
- write terraform plan
'''
    .
    ├── connections.tf
    ├── kube-cluster.tf
    ├── terraform.tfstate
    ├── terraform.tfvars
    └── variables.tf
'''


Output from GCE k8s
gcp_cluster_endpoint = 35.242.250.100
gcp_cluster_name = hr-sirovy
gcp_ssh_command = ssh marek.sirovy@35.242.250.100


- deploy to  k8s ghost blog system, which will use cloudSQL DB

- think about potential issues in the ghost app deployment, and try to prevent them (e.g. memory leaks, failing processes, etc.)

- deploy Datadog to k8s cluster (agent on every node) expect more applications to be running on the same node"

- expect Ghost Blog accepts DATATOD_ADDRESS and DATADOG_PORT environment variables, set them so Ghost is eventually able to send metrics there

- write everything in terraform / Dockerfile / manifest / bash files
