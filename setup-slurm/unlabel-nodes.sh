#!/bin/bash

for node in $(oc get nodes -o name -l scheduler.slinky.slurm.net/external-node=true); do
  echo "removing slurm labels and taints from $node"
  oc label "$node" scheduler.slinky.slurm.net/external-node-
  oc annotate "$node" scheduler.slinky.slurm.net/external-node-partitions-
  oc adm taint node "$node" slinky.slurm.net/managed-node:NoExecute-
done
