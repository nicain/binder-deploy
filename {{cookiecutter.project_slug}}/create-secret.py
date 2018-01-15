import yaml
import argparse
import os
import json


parser = argparse.ArgumentParser()
parser.add_argument('--apiToken', type=str, required=True)
parser.add_argument('--secretToken', type=str, required=True)
parser.add_argument('--template', type=str, default='secret-template.yaml')
parser.add_argument('--secretFile', type=str, default='BinderHub.json')
parser.add_argument('--force', action='store_true')
parser.add_argument('output_file', nargs='?', default='secret.yaml')

args = parser.parse_args()

if os.path.exists(args.output_file):
    if args.force == True:
        os.remove(args.output_file)
    else:
        raise RuntimeError('Output file already exists: %s' % args.output_file)

template = yaml.load(open(args.template, 'r'))


template['jupyterhub']['hub']['services']['binder']['apiToken'] = args.apiToken
template['jupyterhub']['proxy']['secretToken'] = args.secretToken
template['hub']['services']['binder']['apiToken'] = args.apiToken


secretFile = json.load(open(os.path.expanduser(args.secretFile), 'r'))
template['registry']['password'] = "|%s" % json.dumps(secretFile)








# print json.dumps(template, indent=2)

# template['registry']['prefix'] = template['registry']['prefix'].replace('<google-project-id>', args.id).replace('<prefix>', args.prefix)


yaml.dump(template, open(args.output_file, 'w'), default_flow_style=False)