# Settings:
num_nodes='1'
machine_type='n1-standard-2'
zone='us-central1-b'
cluster_name='hello-world'

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
helm init
