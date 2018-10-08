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
- write and run terraform plan for k8s cluster
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


- load k8s config for kubectl
''' 
    gcloud container clusters get-credentials hr-sirovy --zone europe-west3
'''

- enable cloudSQL api https://console.developers.google.com/apis/api/sqladmin.googleapis.com/overview?project=1013002814473
- write terraform for cloud sql and prepare admin user (didn't find how to set permissions)
- have k8s cluster and cloudSQL up and running


deploy to  k8s ghost blog system, which will use cloudSQL DB
------------------------------------------------------------



- think about potential issues in the ghost app deployment, and try to prevent them (e.g. memory leaks, failing processes, etc.)

- deploy Datadog to k8s cluster (agent on every node) expect more applications to be running on the same node"

- expect Ghost Blog accepts DATATOD_ADDRESS and DATADOG_PORT environment variables, set them so Ghost is eventually able to send metrics there

- write everything in terraform / Dockerfile / manifest / bash files
