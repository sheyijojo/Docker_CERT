## container orchestration 

![Docker Orchestration ](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/docker_swarm.png?raw=true)
```md
# health of the host
## health of the containers 

Container orchestration is basically a section of multiple docker hosts 


## What is docker swamp 

Docker swarm will help load balancing 

## Node
Each machines virtual or physical on cloud or prem that has docker installed on it  is known as a node.


## Swarm cluster 
Multiple nodes is what forms a swarm cluster 

At least one manager node and the other worker nodes .

The manager is resposible for receiving instructions from a user or an API

## How do manager get INSTRUCTIONS 

A user provides instructions to the manager node to deploy an application by submitting a service definition . 

```

## Docker Swarm Features
![Docker Swarm features ](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/swarm.png?raw=true)


```md
## Run this command 
docker system info 

comment - you will notice the Swarm to be inacive, hence run docker swarm init 
## swarm status is inactive 
Nodes must be configured with a static ip address as the worker nodes connect to the manager on its IP address.

 You must open the following ports 

port
TCP 2377 - CLuster Management Communications
TCP and UDP 7946 - Communciation among nodes 
UDP 4789 - Overlay network traffic 


## Initialize on the master node 
docker swarm init 

```

## Setting up a three Node Swarm Cluster 
```md
## One manager and two worker nodes 

manager becomes the manager with the docker initi 

## A token is given for worker nodes to join the cluster 
docker swarm join --token SWMTKN-1-1msdndnapsnasnaspnav-saansa 172.31.46.126:2377

## on the worker node
docker system info | grep -i swarm 

docker node ls 

## if the command was erased to add 3rd node, run on manager 

docker swarm join-token worker 

## Leader, Reachable, Unanvailbe managers
Leader is the leader manager of the node

Reachable means a node is a manager but not currently the leader

Unavailable means a node can be a manager but cannot communciate with other node managers.

## print output in a readable format in json 

docker node inspect manager1 --pretty 

```

## Demo creating a three node cluster

```md
## Two centos 4GB RAM, core ccpu 
Both nodes are in the same network and can resolve each other 

cat /etc/centos-release 

nproc 

free -m 

make sure docker enginer is installed on the machine 

systemctl status docker 

docker system info | grep -i swarm 

## promote a worker node to a manager
docker node promote 

docker node ls 

## To demote 
docker node demote workerone 


## Drainning a Node from Ready TO Draining 

docker node update --availabilty drain workerone 

## bring back  availabilty

docker node update --availability active workerone 

## deleting a node, you frain it first

docker node rm workerone 

## disable the swarm node from worker one before rm, run this on the worker node you wanna remove 
docker system info | grep -i swarm 

docker swarm leave 
```

## 