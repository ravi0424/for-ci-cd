#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
kubectl create configmap sql-configmap --from-file=/transport/transport.sql
kubectl apply -f mysql-deploy.yml
kubectl apply -f mysql-svc.yml
kubectl applly -f app-dep.yml

