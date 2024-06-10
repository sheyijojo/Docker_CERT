## Docker Networking 

![docker-scrum](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/docker-scrum.png?raw=true)

```md
## Installed docker 
When you install docker it comes with three networks automatically 

- Bridge - Default network
- None
- Host

## specify a container to a network
docker run ubuntu --network=none

docker run ubuntu --network=host

## 1. The bridge network

- This is a private internal network created by Docker on the host.

- All containers attach to this network by default, usually in the range 172.17 series
- Containers can access each other using this network. 
## to access, map the port the port of the container to the Docker host.
This is the normal process

## 2. Host Network Another way is to associate container to  the host network 
Takes out network isolation between the container and the host. 
e.g 5000
It means no port mapping is needed to access it on the same port 

It means you cannot run multiple containers on the same host, on the same port. e,g 5000, as the port is now common to all containers in the host network . 


## 3. none network
- The containers are not attached to any network and doesnt have nay acess to external network or other containers. 

```

## Creatig internal network to isolate apps
```md
docker network create \
  --driver bridge \
--subnet 182.18.0.0/16
custom-isolated-network 


docker ls 

docker inspect containername 


## Embeddded DNS

Container gets a different IP when system reboots.

Use the container name, container can resolve each other with the name of the container.


Docker has a built-in DNS Seerver that helps resolves the IP to the name. 

## Technbology used for Docker networking
Docker uses namespaces
Docker creates a seperate namespace for each container. It then uses virtual ethernet pairs to connect containers together.


```

## Networking additional commands

```md
docker network ls

docker network inspect 5999909u

## connect a container to a custom network

docker network connect custom-net my-container 

## disconnect a network fron a container

docker network disconnect custom-net my-container 

## remove the network

docker network rm custom-net 

## remove all Unused network

docker network prune 

## inspeact a network
docker network inspect <networkid>| more 

## run a container on an existing created custom network 

docker container run -itd --name=customfirst --net=mycreatenetwork centos:7


## ping one container from the other container 

docker exec -it myappone ping myapptwo 

## check the nameserver of a container
docker exec -it myappone cat /etc/resolv.conf 
```
## stop and remove all containers
`docker container rm $(docker container ls -aq)`