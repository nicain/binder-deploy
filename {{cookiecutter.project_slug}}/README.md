# Binder-deploy

Some helpful scripts for getting [BinderHub](http://binderhub.readthedocs.io/) deployed on Google Cloud

# setup.sh

Configure and deploy Kubernetes cluster.

# deploy.sh

Install and connect jupyterhub/binderhub.

# teardown.sh

Tear down jupyterhub/binderhub and kubernetes cluster.  Splash the URL's to double-check all resources are down.

# TODO

Currently there is a lot of parallel configuration of environment variables in the scripts.  Need to do a better job of organizing them.