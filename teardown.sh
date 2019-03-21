#!/usr/bin/env bash
kubectl delete -f yaml/nfs-bucket-server-rc.yaml
kubectl delete -f yaml/nfs-bucket-server-service.yaml
kubectl delete -f yaml/nfs-bucket-pv.yaml
kubectl delete -f yaml/nfs-bucket-pvc.yaml
kubectl delete -f yaml/nfs-test.yaml