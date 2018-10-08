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
```
    gcloud iam service-accounts create terraform --display-name "Terraform admin account"
```

- export key for terraform and prepare connection
```
    gcloud iam service-accounts keys create tmp/account.json --iam-account terraform@hr-sirovy.iam.gserviceaccount.com
```

- write and run terraform plan for k8s cluster
```
Output from GCE k8s
gcp_cluster_endpoint = 35.198.131.40
gcp_cluster_name = hr-sirovy
gcp_ssh_command = ssh marek.sirovy@35.198.131.40
```

- load k8s config for kubectl
``` 
    gcloud container clusters get-credentials hr-sirovy --zone europe-west3
```

- enable cloudSQL api https://console.developers.google.com/apis/api/sqladmin.googleapis.com/overview?project=1013002814473
- write terraform for cloud sql and prepare admin user (didn't find how to set permissions)
- have k8s cluster and cloudSQL up and running


deploy to  k8s ghost blog system, which will use cloudSQL DB
------------------------------------------------------------
- modify ghost.yml and ghost-service.yml 
- run for yml in persistant-storage-static.yaml persistant-storage-dynamic.yaml ghost.yaml ghost-service.yaml; do kubect create -f $yml; done
- now it is accessable by portforward (waiting for IP from gce)
  kubectl port-forward svc/ghost 2368:2368

ToDo: Configure ingress and letsencrypt


think about potential issues in the ghost app deployment, and try to prevent them (e.g. memory leaks, failing processes, etc.)
------------------------------------------------------------------------------------------------------------------------------
Basic deployment and runtime checks are in ghost.yaml, resource settings should be set after a few benchmarks that identify mem and cpu ussage (so it is currently commented)


deploy Datadog to k8s cluster (agent on every node) expect more applications to be running on the same node
-----------------------------------------------------------------------------------------------------------
- using DaemonSet config, it should deploy datadog agent to each cluster node automaticaly
```
kubectl create -f datadog-agent.yaml
```
- printscreen from datadog UI is included


ToDo:
- expect Ghost Blog accepts DATATOD_ADDRESS and DATADOG_PORT environment variables, set them so Ghost is eventually able to send metrics there
ToDo:
- make own namespace for application
ToDo:
- vault for secrets
ToDo:
- .gitlab-ci.yaml pipeline 
ToDo:
- refactor to module and export vars
ToDo:
- fix all ToDos
