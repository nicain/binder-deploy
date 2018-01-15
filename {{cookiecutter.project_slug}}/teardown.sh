zone={{cookiecutter.zone}}
cluster_name={{cookiecutter.cluster_name}}

helm delete binder --purge
kubectl delete namespace binder
gcloud container clusters delete $cluster_name --zone=$zone

echo "Double-check resources are down:"
echo "    https://console.cloud.google.com/compute/disks?project=${DEVSHELL_PROJECT_ID:-Cloud Shell}"
echo "    https://console.cloud.google.com/kubernetes/list?project=${DEVSHELL_PROJECT_ID:-Cloud Shell}"
echo "    https://console.cloud.google.com/gcr/images/${DEVSHELL_PROJECT_ID:-Cloud Shell}?project=${DEVSHELL_PROJECT_ID:-Cloud Shell}"
echo "    https://console.cloud.google.com/net-services/loadbalancing/loadBalancers/list?project=${DEVSHELL_PROJECT_ID:-Cloud Shell}"
echo "For more info: https://zero-to-jupyterhub.readthedocs.io/en/latest/turn-off.html"