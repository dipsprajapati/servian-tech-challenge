# Summary

This repository consists different tech stacks to create infra on GKE and then deploying app.
The CI/CD principles are followed for the development. It consists of following tech stacks.

1. Terraform - Builds Kubernetes cluster on GKE
2. Circle CI - CI/CD deplyment
3. Docker - Conterization
4. Nginx - Proxy for app
5. Postgrseql - Backend database

# Requirements

1. Terraform 0.13.3
2. Circle CI account
3. Google Cloud Project with Service account with the Editor permission
4. Git

# Installation

1. Clone the git repo: https://github.com/dipsprajapati/servian-tech-challenge.git
2. Modify the iac_gke_cluster/variables.tf
3. Configure the CIrcle CI to build the project from your repo
4. Create following ENV variables in the circleCI's project settings
    - EnVar Name: TF_CLOUD_TOKEN - Value: The Base64 encoded value of the local .terraformrc file  which
      hosts the Terraform Cloud user token
    - EnVar Name: DOCKER_LOGIN - Value: Docker Hub username
    - EnVar Name: DOCKER_PWD - Value: Docker Hub password
    - EnVar Name: GOOGLE_CLOUD_KEYS - Value: The Base64 encoded value of the GCP credential JSON file
5. Create new Google cloud project and create a service account and assign Editor permission.
6. push the code to remote git repo.
7. Run follwoing commands in Gcloud console shell to create secret and configure the 
    Ingree-service resources
    - gcloud config set compute/zone <zone-name>
    - gcloud container clusters get-credentials <cluster-name>
    - kubectl create secret generic pgpassword --form-literal DbPassword=<your-password> 
    - curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    - chmod 700 get_helm.sh
    - ./get_helm.sh
    - helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    - helm install my-release ingress-nginx/ingress-nginx




