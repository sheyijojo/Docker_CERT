## Containerization
How are apps isolated in docker
![namespaces](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/namespaces.png?raw=true)


```md
## Namespace
Docker uses Namespaces to isolate workspace, process IDs..



```
## When linux boots up
- It starts with a process ID of 1;this is the root process
- After this, we have a handful of process running 
- process ID are unique and two processes cannot have the same ID. 

## How a child system within Linux system is done
```md
The container thinks that i has its own root process tree 
- So if a process ID have PID 5 and PID 6 in the host
- They also have a process ID of 1 and 2 in the container 
- These PID 1 and 2 are only visibile within the container  

The host has its namespace

The conatiner has its own namespace

All the process in the container are run in the container namespace. 

It does not see anything outside of its own namespace 

## list process and you see only what goes on in the container 

ps aux

## But on the host, list the processes running and you will see the processes running on the container but with a diff process ID

ps aux

## 
```
## Process ID 
![namespaces](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/namespace-PID.png?raw=true)


## Users from a security standpoint 
```md
## Docker host has diff users
root users
non-root users

## Docker
Dy default, docker run processes within the container  as root user  

## enforce a new user within docker
docker run --user=1000 ubuntu sleep 3600

## you can also specify within the dockerfile
FROM ubuntu 
USER 1000

The root user within the container is not really like the root user on the host

## Increase the capability and priviledges to a user

docker run --cap-add MAC_ADMIN ubuntu

docker run --cap-drop KILL ubuntu 

## to run a container with all privledges assigned
docker run --priviledged ubuntu 
```

## CGROUPS
Control GROUPS is a linux feature used to share and limit resources in a container used by docker 

