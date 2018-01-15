# Binder-deploy

Some helpful scripts for getting [BinderHub](http://binderhub.readthedocs.io/) deployed on Google Cloud

* Use Google Cloud Shell [Google documentation](https://cloud.google.com/shell/docs/starting-cloud-shell) which will give you access to the gcloud command-line tool.
* pip install --user cookiecutter
* export PATH=$PATH:~/.local/bin
* cookiecutter https://github.com/nicain/binder-deploy.git --checkout cookiecutter
* cd into your project slug (default is binder-deploy)
* Copy your google password file into binder-deploy (rename to your input for secretFile, default is BinderHub-private.json)
* ./setup.sh
* ./deploy.sh
* ./info.sh

The last command will tell you the IP address of your BinderHub deployment.  When you are all done:

* ./teardown.sh
* Click on the links that are splashed up, and shut down any remaining resources.


# setup.sh

Configure and deploy Kubernetes cluster.

# deploy.sh

Install and connect jupyterhub/binderhub.

# teardown.sh

Tear down jupyterhub/binderhub and kubernetes cluster.  Splash the URL's to double-check all resources are down.