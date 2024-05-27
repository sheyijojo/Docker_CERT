## Container Memory - Limit and Reservations
What is a linux feature that prevents a process within the container to access raw sockets?

- kernel capbilities 
```md
## containers are just another process running on the host.

As default, there is no restriction to the amount of CPU or Memory to a host 


If required, a container can consume all of the CPU and memory in a host, denying all other processes. 


## Kernel detects the system is out of memory
If the kernel detects the system is out of memory, it starts killing processes on the host. 

## How processes compete for CPU in Linux 
How is a single CPU shared between two processes?

- Processes do not run concurrently. It is allocating share of the CPU in microsecs

## what is respobsible for managing CPU resources, allocating the time and what not

A process scheduler 

In linux, the default scheduler is the CFS- Completely Fair Scheduler 

- In newer versions of DOCKER, It supports the Realtime Scheduler 
```
```md

## For containers - The CGroups
The CG is what enables restricting resources to containers. 

All CPU share get 1024 share by default

## TO modify a container CPU share 

docker container run --cpu-shares=512 webapp

//This still does not limit the amount of CPU that the container consume. The shares only defines the amount of CPU on the host is shared between the containers on the host. 


## Then how do you restrict cpu usage ?

limit a container to use specific CPUs

## speicify which cpu a container can use when having multiple cpus
docker container run --cpuset-cpus=0-1 webapp1

docker container run --cpuset-cpus=0-2 webapp2


## Another way, newer way
use the cpu count option

docker container run --cpus=2.5 webapp

docker container update --cpus=0.5 webapp



## cpus older way 
![cpu_usage](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/cpu_usage.png?raw=true)

