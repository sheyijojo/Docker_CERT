https://reinvent.awsevents.com/all-builders-welcome/

## Kubernetes Deployments - Esp in a PROD environment 

## Deployment is k8 object
![deployment_1](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/deployment.png?raw=true)

```md
## You might want to upgrade your new version one after the other, known as rolling updates

All of these functionalities are available with deployments 

## Deployment is k8 object

Deployment comes higher in the heirachy
Deployment provides us with the capabilities to upgrade the underlying instances seamlessly using rolling updates, undo changes, pause, changes as required

![deployment_2](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/deployment_2.png?raw=true)
```
## Deployment Definition file
```md
The same as Replica set except the kind:Deployment 

kubectl create -f deployment-definition.yml 

kubectl get deployments 

kubectl get replicaset 

kubectl get replicaset 

kubectl get all 
```