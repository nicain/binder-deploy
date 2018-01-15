# Settings:
num_nodes={{cookiecutter.num_nodes}}
machine_type={{cookiecutter.machine_type}}
zone={{cookiecutter.zone}}
cluster_name={{cookiecutter.cluster_name}}

# Install kubectl, a tool for controlling kubernetes:
gcloud components install kubectl

# Create a Kubernetes cluster on Google Cloud:
gcloud container clusters create $cluster_name \
    --num-nodes=$num_nodes \
    --machine-type=$machine_type \
    --zone=$zone

# Test if cluster is initialized:
kubectl get node

# Download and install helm:
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
helm init --upgrade
