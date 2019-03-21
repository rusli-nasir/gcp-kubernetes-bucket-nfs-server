Docker NFS Server
================

Example config on how to create an NFS server that uses a bucket as its share.  

Uses gcsfuse to mount the share internally.

Install
----

First, you need to:
1) Create a secret volume (https://kubernetes.io/docs/concepts/configuration/secret/).  This SA should have access
   to the bucket you want to mount.
   This is all in the replicationcontroller: nfs-bucket-server-rc.   You should change the sa-THE-SERVICE-ACCOUNT name to reflect this.
   The secret mount should have this file: /accounts/key.json

2) UPDATE the environment variable in nfs-bucket-server-rc:BUCKET to the bucket you want to share.
   Use bucket name only, dont prefix with gs://

Then apply these scripts in this order:
```bash
kubectl apply -f yaml/nfs-bucket-server-rc.yaml
kubectl apply -f yaml/nfs-bucket-server-service.yaml
kubectl apply -f yaml/nfs-bucket-pv.yaml
kubectl apply -f yaml/nfs-bucket-pvc.yaml
```

This job lists the content of the bucket (for debugging)
```bash
kubectl apply -f yaml/nfs-bucket-pvc.yaml
```

To build from dockerfile
----
```bash
docker build -t anderselton/nfs-bucket-server:1.0 .
docker push anderselton/nfs-bucket-server:1.0 .
```

More Info
=========

Based on various resources I found:
* https://estl.tech/multi-writer-file-storage-on-gke-6d044ec96a46
* https://github.com/alphayax/docker-volume-nfs