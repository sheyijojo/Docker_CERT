## Kubernetes(k8) Infrastructure 
![k8_intro](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/k8_intro.png?raw=true)

##

```md
I took my time to learn the docker swarm architecture and the concept of orchestration is similar with kubernetes.

The commands and naming nomencleture is what differs and what I need to work on. 

##
A cluster is a set of node.

## Who is responsible for mananing the cluster in Kubernetes
- The master is what has the control plane component and it watches over the nodes in the cluster
 and is responsible for orchestrating containers on the worker node

```
## When you install K8, you install these components
![k8s_components](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/k8_components.png?raw=true)

```md
## API Server (api access management)
API server acts as the frontend for kubernete. User's devices, CLI all talk to the API server to talk to the cluster

## etcd
This is the key value store to store data of the nodes in the cluster. Implements the logs to ensure there are no conflicts among the nodes. 

## scheduler (container distribtunin)
Resonsible for distrbuting workload or containers across nodes in the cluster. Looks for newly created containers and assign them to nodes.

## Controller (nodes managing)
This is the brain behind orchestration. They responsible for noticing and responding when nodes or containers.go down. Brings up new containers in such cases

## Container runtime 
This is the underlying software used to run containers which is Docker

## Kubelet (agents on everynodes)
This is an agent that runs ioneach nodes in the cluster. Make sure the containers are running on each nodes as expected

## kubectl 

k8 CLI. 


## basic commands

kubectl run hello-minikube
kubectl cluster-info 
kubectl get nodes 

kubectl run my-web-app --image=my-web-app --replicas=1000
```
