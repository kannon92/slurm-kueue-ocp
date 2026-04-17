oc adm new-project slurm
oc adm policy add-scc-to-user privileged -n slurm -z default 
helm install slurm oci://ghcr.io/slinkyproject/charts/slurm --namespace=slurm \
  --version 1.1.0 \
  --set loginsets.slinky.enabled=false \
  --set controller.extraConfMap.MCSPlugin=mcs/label \
  --set-literal controller.extraConfMap.MCSParameters=ondemand,ondemandselect \
  --set nodesets.slinky.replicas=0 \
  --set controller.service.spec.type=ClusterIP

