controller_node=$(oc get pod slurm-controller-0 -n slurm -o jsonpath='{.spec.nodeName}' 2>/dev/null || true)
if [ -n "$controller_node" ]; then
  echo "excluding node/$controller_node (hosts slurm-controller-0) from labeling"
fi

count=0
for node in $(oc get nodes -o name -l node-role.kubernetes.io/worker=''); do
  if [ -n "$controller_node" ] && [ "$node" = "node/$controller_node" ]; then
    echo "skipping $node (slurm-controller-0 node)"
    continue
  fi
  echo "label node $node"
  oc patch "$node" -p '{"metadata":{"labels":{"scheduler.slinky.slurm.net/external-node": "true"},"annotations":{"scheduler.slinky.slurm.net/external-node-partitions": "all"}}}'
  count=$((count + 1))
  if [ "$count" -ge 2 ]; then
    break
  fi
done

