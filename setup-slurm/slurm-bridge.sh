oc apply -f token.yaml

helm install slurm-bridge oci://ghcr.io/slinkyproject/charts/slurm-bridge \
  --namespace=slinky --create-namespace -f slurm-bridge-values.yaml

echo "Waiting for slurm-bridge deployments..."
oc rollout status deployment/slurm-bridge-admission -n slinky --timeout=300s
oc rollout status deployment/slurm-bridge-controllers -n slinky --timeout=300s
oc rollout status deployment/slurm-bridge-scheduler -n slinky --timeout=300s

