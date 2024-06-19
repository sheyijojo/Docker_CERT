## container orchestration 

![Docker Orchestration ](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/docker_swarm.png?raw=true)
```md
# health of the host
## health of the containers 

Container orchestration is basically a section of multiple docker hosts 


## What is docker swamp 

Docker swarm will help load balancing 

## Node
Each machines virtual or physical on clour or prem that has docker installed on it  is known as a node.


## Swarm cluster 
Multiple nodes us what forms a swarm cluster 

At least one manager node and the oother worker nodes .

The manager is resposible for receiving instructions from a user or an API

## How do manager get INSTRUCTIONS 

A user provides instructions to the manager node to deploy an application by submitting a service definition . 

```

## Docker Swarm Features
![Docker Swarm features ](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/swarm.png?raw=true)


```md
docker system info 

## swarm status is inactive 
Nodes must be configured with a static ip address as the worker nodes connect to the manager on its IP address.

 You must open the following ports 

port
TCP 2377 - CLuster Management Communications
TCP and UDP 7946 - Communciation among nodes 
UDP 4789 - oOverlay network traffic 


## Initialize
docker swarm init 

```