## Overlay Networks 

```md
## There are three diff types of networks available in docker 
- Bridge 
- none
- host 

When you intialize a Docker swarm cluster, it creates a new network of type overlay, an internal private network thst spans accross all nodes in the cluster. 

When docker swarm is initialized, the default type of network is the ingress neteork 

Imagine we have a single node cluster and we plan to run a web server container on it and each of it tries to map port 5000 to 80 on the same host
```
![ingress](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/INGRESS.png?raw=true)
```md
## Ingress Network 

This is not possible because we cannot have two port mappings of the same type, this is where Ingress Network comes in.

Ingress network has a built in load balancer that redirects traffic from 80 to 5000

## so two types of network
Ingress is created automatically.
Ingress is a type of overlay network. 

The Birdge network known as docker_gwbridge Network connects the individual daemon to the other daemons participating in the swarm 

## can create an overlay network type

docker network create --driver overlay my-overlay-network 
## can create a subnet for the network

docker network create --driver overlay --subnet 10.15.0.0/16 my-overlay-network 

## overlay networks can only be used by services in the swarm cluster and not standalone containers

## to allow standalone containers to join the network

docker network create --driver overlay --attachable my-overlay-network 

## by default, swarm services are ecinyrpted

## encrypt the app data 
docker network create --driver overlay --opt encrypted my-overlay-network 

## attach a service to a network at creation 

docker service create --network my-overlay-network my-web-service 

## delete 

docker network rm my-overlay-network 

## unusued network 

docker network prune
```
## publishing a port 

```md
docker service create --publish published=80, target=5000 my-web-server
```
