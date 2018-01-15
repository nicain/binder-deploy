clean:
	rm -f secret.yaml
	rm -f config.yaml

cluster-status:
	kubectl get node

jupyterhub-ip:
	@echo "Jupyterhub IP: " `kubectl --namespace=binder get svc proxy-public | awk '{ print $4}' | tail -n 1`

binderhub-ip:
	@echo "Binderhub IP: " `kubectl --namespace=binder get svc binder | awk '{ print $4}' | tail -n 1`

info: cluster-status jupyterhub-ip binderhub-ip