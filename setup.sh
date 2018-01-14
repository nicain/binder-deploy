apiToken=`openssl rand -hex 32`
secretToken=`openssl rand -hex 32`
id='reliable-cairn-192018'
prefix='dev'
FORCE='--force'
secretFile='BinderHub-private.json'

python create-config.py --id=$id --prefix=$prefix $FORCE
python create-secret.py --apiToken=$apiToken --secretToken=$secretToken --secretFile=BinderHub-private.json $FORCE