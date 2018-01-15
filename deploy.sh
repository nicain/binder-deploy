# Settings:
id='reliable-cairn-192018'
prefix='dev'
secretFile='BinderHub-private.json'
FORCE='--force'

# Initializations:
apiToken=`openssl rand -hex 32`
secretToken=`openssl rand -hex 32`

# Get the latest helm chart for BinderHub:
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart
helm repo update

# Install the Helm Chart using the configuration files, to deploy both a BinderHub and a JupyterHub:
python create-config.py --id=$id --prefix=$prefix
python create-secret.py --apiToken=$apiToken --secretToken=$secretToken --secretFile=$secretFile $FORCE
helm install jupyterhub/binderhub --version=v0.1.0-397eb59 --name=binder --namespace=binder -f secret.yaml -f config.yaml

# Now that JupyterHub, grab its IP address and update Binderhub to link together:
jupyterhub_ip=`kubectl --namespace=binder get svc proxy-public | awk '{ print $4}' | tail -n 1`
python create-config.py --id=$id --prefix=$prefix --jupyterhub_ip=$jupyterhub_ip $FORCE
helm upgrade binder jupyterhub/binderhub --version=v0.1.0-397eb59 -f secret.yaml -f config.yaml
