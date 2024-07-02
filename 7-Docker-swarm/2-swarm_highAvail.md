### Swarm High Availability 

```md
Manager node is known for managing the worker state.
Having multiple manager nodes is recommended for fault tolerance 
 
## conflict of interest, a leader is used to make management decisions 
Other managers need to be aware of the application state, which is called a Distributed consensus-. Hence, then implementing the RAFT consensus algorithm. 

RAFT - Decides who is going to become the leader among the three manager nodes. 

It uses a timer notification for a node to become a leader as a manager 

If it fails, there will be no manager to manage the cluster.



## The RAFT concept is just about a random timer concept 

## How manager vs nodes 

Docker recommends no more than 7 managers nodes for a swarm .


```
## Continuation 

```md
## Every manager has a copy of the database
A leader manager with decisions to add a new worker node to the cluster has to inform other managers of its decision. 

It gets response from at least one of the worker to reach quorum and commit the changes to the database on all master nodes.

This means that any changes made by any of the managwer is with consensus from majority of the managers in the cluster. 

```
![quorum](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/quorum.png?raw=true)
```md

## 
Quorum is defined as the min num of members in an assembly that must be present at any of its meetings to make the proceedings of the meeting valid.


## Fault tolerance
The min number of nodes that can fail 
In essence, how many nodes failure the cluster can withstand. 

fault tolerance(N) = (N-1)/2


## select odd number for master nodes when you design your env

## Distrubute your managers accross diff datacenters 

## TO reovcer from quaorum is to bring back the nodes back online 

## if you cannot bring the nodes back online, force create
docker swarm init --force-new-cluster 

## to promte a worker node to become a master
docker node promote 
```

## Distributed consensus - RAFT - Auto-Lock 
Nodes can leave a cluster and will need to rejoin with this key. 
```md
- Rafts logs are stored on disk
- encryption and tls KEYS ARE STORED IN THE Node memory byu default
- Docker provides option to take ownership of the management of the key to store in an external key bmanagement system

## For a new cluster 
- docker swarm init --autolock=true

## for an existing cluster 
docker swarm update --autolock=true

store the key safe;y 

## rejoin the cluster 
docker swarm unlock 

```

## Demo service in Swarm 

```md
## create a service with a httpd:alpine image in docker swarm 
docker service create --name=fortstservice -p 80:80 httpd:alpine 

```