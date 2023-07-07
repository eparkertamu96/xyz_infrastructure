#! /bin/bash

# In Ubuntu, may need to run this file with sudo

# Deploy the infrastructure
cdk deploy

# Get region and created role
region=$(kubectl config view -o json | node -pe "JSON.parse(require('fs').readFileSync('/dev/stdin').toString()).users.filter(u => u.name.indexOf('eks-blueprint') > -1)[0].user.exec.args[1]")
role=$(kubectl config view -o json | node -pe "JSON.parse(require('fs').readFileSync('/dev/stdin').toString()).users.filter(u => u.name.indexOf('eks-blueprint') > -1)[0].user.exec.args[9]")

echo "Region is: ${region}"
echo "Role is: ${role}"

# Update kube config
aws eks update-kubeconfig --name eks-blueprint --region $region --role-arn $role

# Validate that we can connect to the cluster. Exit if not all 5 are active
test $(kubectl get namespace -o json | node -pe "JSON.parse(require('fs').readFileSync('/dev/stdin').toString()).items.filter(n => (n.status.phase) === 'Active')".length) -eq 5 && echo 'Deployment is Active' || exit 1

# Deploy the XZY Docker container which is in GitHub
kubectl apply -f xyz_config.yaml

# Test that the app is up and running
xyz_url=$(kubectl get services xyz-api-service -o json | node -pe "JSON.parse(require('fs').readFileSync('/dev/stdin').toString()).status.loadBalancer.ingress[0].hostname" )
echo "Project URL is: ${xyz_url}"

message=$(curl "http://${xyz_url}" | node -pe "JSON.parse(require('fs').readFileSync('/dev/stdin').toString()).message") 
echo "The message is: ${message}"

[ "${message}" = "Automate all the things!" ] && echo "Passed: The message matches!" || echo "Failed: App did not return the correct message."