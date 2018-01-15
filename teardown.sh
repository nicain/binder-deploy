zone='us-central1-b'
cluster_name='hello-world'
id='reliable-cairn-192018'

helm delete binder --purge
kubectl delete namespace binder
gcloud container clusters delete $cluster_name --zone=$zone

echo "Double-check resources are down:"
echo "    https://console.cloud.google.com/compute/disks?project=$id"
echo "    https://console.cloud.google.com/kubernetes/list?project=$id"
echo "    https://console.cloud.google.com/gcr/images/$id?project=$id"
echo "    https://console.cloud.google.com/net-services/loadbalancing/loadBalancers/list?project=$id"
echo "For more info: https://zero-to-jupyterhub.readthedocs.io/en/latest/turn-off.html"