https://reinvent.awsevents.com/all-builders-welcome/

## Kubernetes Deployments - Esp in a PROD environment 

### Deployment is k8 object
![deployment_1](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/deployment.png?raw=true)

```md
## You might want to upgrade your new version one after the other, known as rolling updates

All of these functionalities are available with deployments 

## Deployment is k8 object

Deployment comes higher in the heirachy
Deployment provides us with the capabilities to upgrade the underlying instances seamlessly using rolling updates, undo changes, pause, changes as required

## So what happens when we run deployments 
1. It creates a deployment object with the name we specified inthe deployment yaml fil. kubectl get deployments 
2. It created a pod with a prefixed deployment name and shows it running 
3. If we had replicas speicified, it will take the deployment prefix as well. 

![deployment_2](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/deployment_2.png?raw=true)
```
## Deployment Definition file
```md
The same as Replica set except the kind:Deployment 

kubectl create -f deployment-definition.yml 

## record the course of change 
kubectl create -f deployment-definition.yaml --record

## This juts record the commands you ran to create the deploymen
kubectl get deployments 

kubectl get replicaset 

kubectl get replicaset 

kubectl get all 
```
## Deployments - Updates and Rollback
![ReplicaSet](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/rollouts_deployment.png?raw=true)

## rolling update 
![rolling_recreate](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/rolling_updates.png?raw=true)
```md
## see status of rollouts 
kubectl rollout status deployment/myapp-deployment 

kubectl rollout history deployment/myapp-deployment 

## How to update deployment 

kubectl apply -f deployment-definition.yaml 

## Undo a rollback 

kubectl rollout undo deployment/myapp-deployment 
```
## Can also specify a deployment by running with only an image name 

```md
kubectl run nginx --image=nginx

```