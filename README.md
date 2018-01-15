# Binder-deploy

Some helpful scripts for getting [BinderHub](http://binderhub.readthedocs.io/) deployed on Google Cloud

* Use Google Cloud Shell [Google documentation](https://cloud.google.com/shell/docs/starting-cloud-shell) which will give you access to the gcloud command-line tool.
* pip install --user cookiecutter
* export PATH=$PATH:~/.local/bin
* cookiecutter https://github.com/nicain/binder-deploy.git

Here you will need to direct cookiecutter to your google password file.  By default, the template will look in ~/.secret/BinderHub.json

* cd binder-deploy && ./setup.sh && ./deploy.sh

I have been seeing an error that I don't know much about: "Error: could not find a ready tiller pod".  If you see this too, just wait a few seconds, and then re-run ./deploy.sh.  Lastly:

* ./info.sh

The command will tell you the IP address of your BinderHub deployment.  When you are all done:

* ./teardown.sh
* Click on the links that are splashed up, and shut down any remaining resources.


# setup.sh

Configure and deploy Kubernetes cluster.

# deploy.sh

Install and connect jupyterhub/binderhub.

# teardown.sh

Tear down jupyterhub/binderhub and kubernetes cluster.  Splash the URL's to double-check all resources are down.