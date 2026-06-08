#!/bin/bash

set -e

echo "============================================================"
echo " Setting up Slurm Bridge on OpenShift "
echo "============================================================"
echo ""
echo "WARNING: Pre-requisite - Install cert manager from upstream or openshift catalog."
echo "If you haven't done this, please press Ctrl+C to abort and install it first."
echo ""
read -p "Press Enter to continue (or Ctrl+C to abort)..."

echo ""
echo "a) Installing slurm-operator..."
./slurm-operator.sh

echo ""
echo "b) Installing slurm..."
./slurm.sh

echo ""
echo "c) Installing slurm-bridge..."
./slurm-bridge.sh

echo ""
echo "d) Applying RBAC hack..."
./rbac-hack.sh

echo ""
echo "e) Labeling nodes..."
./label-nodes.sh

echo ""
echo "============================================================"
echo " Setup complete! "
echo "============================================================"
