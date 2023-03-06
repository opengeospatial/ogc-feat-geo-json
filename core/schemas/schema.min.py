#---------------------------------------------------------------------------------
# derived from https://github.com/cityjson/specs/blob/main/misc/schema-minifier.py
#---------------------------------------------------------------------------------

import os
import json
import jsonref

#-------------------------------------------------------------------------------------
# functions to remove $defs (all values have been resolved) and nested $id and $schema
#-------------------------------------------------------------------------------------

def remove_key(input, key):
    if isinstance(input, dict):
        return {k: remove_key(v, key) for k, v in input.items() if k != key}
    elif isinstance(input, list):
        return [remove_key(element, key) for element in input]
    else:
        return input

def remove_keys(js):
    js1 = remove_key(js, "$defs")
    js1 = {k: remove_key(v, "$id") if isinstance(v, dict) else v for k, v in js1.items()}
    js1 = {k: remove_key(v, "$schema") if isinstance(v, dict) else v for k, v in js1.items()}
    js1 = {k: remove_key(v, "description") if isinstance(v, dict) else v for k, v in js1.items()}
    return js1

#-------------------------------------------------------------------------------------
# function to resolve and inline $ref values
#-------------------------------------------------------------------------------------

def resolve_refs(root_schema_path):
    root_schema = os.path.abspath(root_schema_path)
    fins = open(root_schema)

    abs_path = os.path.abspath(os.path.dirname(root_schema))
    base_uri = 'file://{}/'.format(abs_path)

    js = jsonref.loads(fins.read(), jsonschema=False, base_uri=base_uri)

    # -- remove $defs and nested $id and $schema
    js = remove_keys(js)
    js['$id'] = js['$id'].replace('.json', '.min.json')

    json_str = json.dumps(js, separators=(',',':'))
    f = open(root_schema_path.replace('.json', '.min.json'), 'w')
    f.write(json_str)

#-----------------
# feature.min.json
#-----------------
resolve_refs('feature.json')

#---------------------------
# featurecollection.min.json
#---------------------------
resolve_refs('featurecollection.json')
