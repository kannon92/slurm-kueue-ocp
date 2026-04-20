helm install slurm-bridge oci://ghcr.io/slinkyproject/charts/slurm-bridge \
  --namespace=slinky --create-namespace -f slurm-bridge-values.yaml

