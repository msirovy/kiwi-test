
provider "google" {
    credentials = "${file("../tmp/account.json")}"
    project     = "hr-sirovy"
    region      = "europe-west3"
}

provider "kubernetes" {}
