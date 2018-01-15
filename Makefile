clean:
	rm -f secret.yaml
	rm -f config.yaml

cluster-status:
	kubectl get node
