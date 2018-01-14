apiToken=`openssl rand -hex 32`
secretToken=`openssl rand -hex 32`
id='reliable-cairn-192018'
prefix='dev'
FORCE='--force'
secretFile='BinderHub-private.json'
num_nodes='1'
machine_type='n1-standard-2'
zone='us-central1-b'
cluster_name='hello-world'

gcloud components install kubectl

gcloud container clusters create $cluster_name \
    --num-nodes=$num_nodes \
    --machine-type=$machine_type \
    --zone=$zone

curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
helm init

python create-config.py --id=$id --prefix=$prefix $FORCE
python create-secret.py --apiToken=$apiToken --secretToken=$secretToken --secretFile=BinderHub-private.json $FORCE