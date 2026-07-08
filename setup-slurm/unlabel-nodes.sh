#!/bin/bash

for node in $(oc get nodes -o name); do
  echo "removing slurm labels, annotations, and taints from $node (if present)"
  oc label "$node" scheduler.slinky.slurm.net/external-node- 2>/dev/null || true
  oc annotate "$node" scheduler.slinky.slurm.net/external-node-partitions- 2>/dev/null || true
  oc adm taint node "$node" slinky.slurm.net/managed-node:NoExecute- 2>/dev/null || true
done
