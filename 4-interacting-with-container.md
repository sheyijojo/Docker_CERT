## Interacting with a container

```md
## This is interacting with a container already running 

To exit a container in "it" mode - interactive terminal mode  use a keyboard shortcut 

`CTRL+p+q`  - an escape sequence 

This brings it to detach mode 


## Execute a command on the container
docker container exec b71221f3113 hostname

//This checks the hostname of the docker container 


## Enter the shell of a running container 
docker container exec -t b71212b1121b /bin/bash


## if you exit, you can attach back to the container 

docker container attached b7243232323

//this takes you back into the container 
```



## Inspecting a container 


```md
## returns all details of a container in a json
docker container inspect webapp

## Container stats with native docker utility
docker container stats

//checks cpu, mem, neti/o, block 


## list processes as

docker container top webapp

## list Docker logs

docker container logs containerid

## live logs
docker container logs -f webapp


## see all the events when a container is ran
docker system events --since 60m


```