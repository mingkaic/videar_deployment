#!/usr/bin/env bash
CFG_NAME=videar-config
kubectl create configmap $CFG_NAME \
    --from-literal=db_host=$(minikube ip) \
    --from-literal=s2t_host=$(minikube ip) \
    --from-literal=uas_host=$(minikube ip) \
    --from-literal=audiosearch_app_id=$AUDIOSEARCH_APP_ID \
    --from-literal=audiosearch_secret=$AUDIOSEARCH_SECRET
kubectl get configmap $CFG_NAME -o yaml
