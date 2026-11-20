oc apply -f token.yaml

helm install slurm-bridge oci://ghcr.io/slinkyproject/charts/slurm-bridge \
  --namespace=slurm --version 1.3.0 --create-namespace -f slurm-bridge-values.yaml

echo "Waiting for slurm-bridge deployments..."
# while we have the rbac hack we have to proceed without checking this.
# oc rollout status deployment/slurm-bridge-admission -n slurm --timeout=300s
# oc rollout status deployment/slurm-bridge-controllers -n slurm --timeout=300s
# oc rollout status deployment/slurm-bridge-scheduler -n slurm --timeout=300s

