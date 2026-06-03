# Setup Slurm Bridge on Openshift

Pre reqs:

Install cert manager from upstream or openshift catalog

a) install slurm-operator

./slurm-operator.sh

b) Install slurm

./slurm.sh

This labels slurm namespace for OCP and installs slurm

c) Install slurm-bridge

./slurm-bridge.sh

This installs slurm-bridge using the admisison controler to operator only on special namespaces

d) Apply hack

This is required until there is a patch release fixing the rbac on OCP.
Should be a release for 1.1.1 soon.

./rbac-hack.sh

e) Node labels

I don't quite understand how to do this in production.

This will pick 3 worker nodes and set them up for slurm.

./label-nodes.sh


