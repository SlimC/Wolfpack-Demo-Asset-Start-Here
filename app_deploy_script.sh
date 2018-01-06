#!/bin/bash
echo Please enter a unique prefix for your Wolfpack Demo App Instances:
read prefix
fitness_deployment=$prefix"-fitness"
fitness_service=$prefix"-fitness"
chat_deployment=$prefix"-chat"
chat_service=$prefix"-chat"
bx api https://api.ng.bluemix.net
bx login -sso
bx target -o NAChannels -s "Wolfpack Demo Development"
bx cs cluster-config wolfpack-cluster
kubectl run $fitness_deployment --image=registry.hub.docker.com/dlsolomo/fitness_iot:latest --port 1880
kubectl expose deployment $fitness_deployment --type=NodePort --name=$fitness_service
kubectl describe services $fitness_service
kubectl run $chat_deployment --image=registry.hub.docker.com/dlsolomo/fitness_chatbot:latest --port 1880
kubectl expose deployment $chat_deployment --type=NodePort --name=$chat_service
kubectl describe services $chat_service
echo Your Deployment have been Created.  You can access your apps from http://184.172.250.58:<ports listed above beginning with 31 or 32>
