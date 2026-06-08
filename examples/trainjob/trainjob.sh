helm install kubeflow-trainer oci://ghcr.io/kubeflow/charts/kubeflow-trainer \
    --namespace kubeflow-trainer \
    --create-namespace \
    -f values.yaml

