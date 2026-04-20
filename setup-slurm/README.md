# Setup Slurm Bridge on Openshift

a) install slurm-operator

./slurm-operator.sh

b) Install slurm

./slurm.sh

This labels slurm namespace for OCP and installs slurm

c) Install slurm-bridge

./slurm-bridge.sh

This installs slurm-bridge using the admisison controler to operator only on special namespaces

d) Apply hack

./rbac-hack.sh

e) Node labels

I don't quite understand how to do this in production.

Pick one node and label it for slurm-only.

./label-nodes.sh


