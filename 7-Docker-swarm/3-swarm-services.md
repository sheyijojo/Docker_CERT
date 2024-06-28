## Swarm services
![task](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/task.png?raw=true) 
```md
The component of the swarm orchestration is the service 

services are one or more instances of a single application

e.g 
## commands

## On the manager node 
docker service create --replicas=3 httpd 

docker service create --name=firstservice -p 80:80 httpd:apline 

docker service ls

docker service ps firstservice 

docker service inspect firstservice --pretty 

docker service logs firstservice 

docker service rm firstservice 
```

## scaling, rollling updates and rollbacks 

```md
## rolling image one instance at a time 
docker service update -p 80:80 --image=web:2 web

## add a dely flag if you want to 

docker service update -p 80:80 --update-delay 60s --image=web:3 web 

## update multiple instances at a time
docker service update -p 80:80 --update-parallelism 3 --image=web:2 web 

//This updates 3 instances at a time 

## check all the update settings 
docker service inspect web 

## what if an update fails 
by default it is pause.

docker service update -p 80:80 \
   --update-failure-action pause|continue|rollback \
   --image=web2 web 


## revert to the old  version

docker service update --rollback web 
```

## Replicas vs Global Service Types

```md
## Diff types of services 
The default service is the replicated service 

docker service inspect web --pretty | grep -i "service mode"

## Another service is global service 
docker service create --mode=global agent 

You do not need a replica count, good for monitoring agents or logging agents 
```

## Placement in Swarm

```md


```