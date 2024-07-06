## PODS 
```md
## Pods
K8 does not deploy containers directly on the worker nodes, the containers are encapsulated into a kubernetes object known as PODS

A pod is a single instance of an application. The smallest object 

## scaling an app in K8
when an application scaling is needed, we dont bring up new container instances on the same pod, rather we create a new pod for the new container instance. 

```
## Mutli-containers in a pods
```md
## can we have multi containers in a pod?
Rarely used cases
Yes, we can but it is usually not containers/apps of the same kind

More like a helper container that does some tasks that needs to a help a container 

```
## commands
```md
kubectl run nginx --image nginx 

kubectl get pods 
# get more information from the pods 
kubectl describe pod my-pod-running 

## kubectl with wode options
kubectl get pods -O wide 
```
