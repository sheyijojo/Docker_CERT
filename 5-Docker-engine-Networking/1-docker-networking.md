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

## The bridge network

- This is a private internal network created by Docker on the host.

All containers attach to this network by default, usually in the range 172.17 series

## to access, map the port the port of the container to the Docker host.
This is the normal process

## Another way is to associate the host network 
Takes out network isolation between the container and the host. 
e.g 5000
It means no port mapping is needed to access it on the same port 

It means you cannot run multiple containers on the same host, on the same port. e,g 5000



```