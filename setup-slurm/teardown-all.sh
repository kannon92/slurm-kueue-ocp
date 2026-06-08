#!/bin/bash

echo "============================================================"
echo " Tearing down Slurm Bridge on OpenShift "
echo "============================================================"
echo ""

echo "e) Unlabeling nodes..."
for node in $(oc get nodes -o name -l node-role.kubernetes.io/worker=''); do
  echo "unlabel node $node"
  oc label "$node" scheduler.slinky.slurm.net/external-node- >/dev/null 2>&1 || true
  oc annotate "$node" scheduler.slinky.slurm.net/external-node-partitions- >/dev/null 2>&1 || true
done

echo ""
echo "c) Uninstalling slurm-bridge..."
oc delete -f token.yaml --ignore-not-found=true || true
helm uninstall slurm-bridge --namespace=slinky || true

echo ""
echo "b) Uninstalling slurm..."
helm uninstall slurm --namespace=slurm || true
oc adm policy remove-scc-from-user privileged -n slurm -z default || true
oc delete project slurm || true

echo ""
echo "a) Uninstalling slurm-operator..."
helm uninstall slurm-operator --namespace=slinky || true
helm uninstall slurm-operator-crds || true
oc delete project slinky || true

echo ""
echo "============================================================"
echo " Teardown complete! "
echo "============================================================"
