## Relication Controllers are replaced with Replicaset
```md
Replica set is the new recommeded way to set up replication 

Controllers are the brain behind kubernetes, they are the processes that monitor k8 objects and respond accordingly 

## They are diff types of controllers, we are talking about replication controllers here 

Replication controller helps us run multiple instances of a single pod in the kubernetes cluster.

This achieves high availability 

Replication controller ensures the specified number of pods are running at all times even 1 0r 100

load balancing and scaling 
```

![rc](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/replication_controller.png?raw=true)

## RC controller

```md
kubectl create -f rc-definition.yml 

kubectl get replicationcontroller 

kubectl get pods

```
## Replica Set
![ReplicaSet](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/ReplicaSet.png?raw=true)
```md
Similar to RC but apiVersion is apps/v1
ReplicaSet requires a selecto to speicfy what pods fall under it. 

Replica set can also manage pods not created as part of the rp set definition file 

We need a matching label to specify which pods to include.
Labels are used as filters for the replica set 

## get the replica sets 

kubectl create -f filename.yaml

kubectl get replicaset 

kubectl get pods 

## scaling replica sets 
## Note, using the file as input only will not update the replicas automatically
1. sccale inside the defintion file and the below command 
 kubectl replace -f replicaset-defintion 
2. Option 2 is to run the below command
 kubectl scale --replicas=6 -f replicase-definition.yaml 

## Note, using the file as input only will not update the replicas automatically
3. kubectl edit replicaset replicaset-name 
4. scale without using the definition file 
  kubectl scale replicaset replicatsetname --replicas=2

```
## Demo
![ReplicaSet_Demo](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/replica_set_demo.png?raw=true)
```md
## Notice some key points here in the demo file 
List the root parameters first

- apiVersion
- Kind
- metadata
- spec
## the spec has the most children and , and they are
spec
 selector
 replicas
 template
  



```
