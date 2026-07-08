oc patch clusterrole slurm-operator --type='json' -p='[ { "op": "add", "path": "/rules/-", "value": { "apiGroups": [""], "resources": ["secrets/finalizers"], "verbs": ["update"] } } ]'
