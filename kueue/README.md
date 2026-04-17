# Kueue

For Openshift, you can install Kueue from Openshift 4.21.

## Kueue Cluster 

apiVersion: kueue.openshift.io/v1
kind: Kueue
metadata:
spec:
  config:
    integrations:
      frameworks:
        - BatchJob
  logLevel: Normal
  managementState: Managed
  operatorLogLevel: Normal

## Openshift Kueue gotchas

By default, all workloads that Kueue manages must be labeled.

Add the following label to a namespace:

kueue.openshift.io/managed=true


