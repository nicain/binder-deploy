import yaml
import argparse
import os


parser = argparse.ArgumentParser()
parser.add_argument('--id', '--google-project-id', type=str, required=True)
parser.add_argument('--prefix', type=str, required=True)
parser.add_argument('--template', type=str, default='config-template.yaml')
parser.add_argument('--force', action='store_true')
parser.add_argument('output_file', nargs='?', default='config.yaml')

args = parser.parse_args()

if os.path.exists(args.output_file):
    if args.force == True:
        os.remove(args.output_file)
    else:
        raise RuntimeError('Output file already exists: %s' % args.output_file)



template = yaml.load(open(args.template, 'r'))
template['registry']['prefix'] = template['registry']['prefix'].replace('<google-project-id>', args.id).replace('<prefix>', args.prefix)
yaml.dump(template, open(args.output_file, 'w'), default_flow_style=False)