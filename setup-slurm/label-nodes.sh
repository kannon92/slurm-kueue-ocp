count=0
for node in $(oc get nodes -o name -l node-role.kubernetes.io/worker=''); do
  echo "label node $node"
  oc patch "$node" -p '{"metadata":{"labels":{"scheduler.slinky.slurm.net/external-node": "true"},"annotations":{"scheduler.slinky.slurm.net/external-node-partitions": "all"}}}'
  count=$((count + 1))
  if [ "$count" -ge 3 ]; then
    break
  fi
done

