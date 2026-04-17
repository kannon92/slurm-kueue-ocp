oc patch clusterrole slurm-bridge-scheduler --type='json' -p='[ { "op": "add", "path": "/rules/-", "value": { "apiGroups": [""], "resources": ["pods/finalizers"], "verbs": ["update", "patch"] } } ]'
