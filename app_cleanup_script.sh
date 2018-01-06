#!/bin/bash
echo This script will remove your running Wolfpack demo applications and services from the cluster.
echo Please enter a unique prefix for your running Wolfpack Demo App Instances:
read prefix
fitness_deployment=$prefix"-fitness"
fitness_service=$prefix"-fitness"
chat_deployment=$prefix"-chat"
chat_service=$prefix"-chat"
bx api https://api.ng.bluemix.net
bx login -sso
bx target -o NAChannels -s "Wolfpack Demo Development"
bx cs cluster-config wolfpack-cluster
kubectl delete deployment $fitness_deployment
kubectl delete deployment $chat_deployment
kubectl delete services $fitness_service
kubectl delete services $chat_service
echo Your deployments and services have been removed.

