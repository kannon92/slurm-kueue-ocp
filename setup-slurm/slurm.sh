oc adm new-project slurm
oc adm policy add-scc-to-user privileged -n slurm -z default 
helm install slurm oci://ghcr.io/slinkyproject/charts/slurm --namespace=slurm \
  --version 1.1.0 \
  --set loginsets.slinky.enabled=false \
  --set controller.extraConfMap.MCSPlugin=mcs/label \
  --set-literal controller.extraConfMap.MCSParameters=ondemand,ondemandselect \
  --set nodesets.slinky.replicas=0 \
  --set controller.service.spec.type=ClusterIP

echo "Waiting for slurm-controller and slurm-restapi deployments..."

while ! oc get statefulset/slurm-controller -n slurm >/dev/null 2>&1; do sleep 2; done
oc rollout status statefulset/slurm-controller -n slurm --timeout=300s

while ! oc get deployment/slurm-restapi -n slurm >/dev/null 2>&1; do sleep 2; done
oc rollout status deployment/slurm-restapi -n slurm --timeout=300s

