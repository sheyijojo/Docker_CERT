## Docker config objects 
```md
## Scenario 
Imagine you have an nginx config file you want to mount on the docker container. 
And you need multiple containers to have this nginx file. 


This is when config objects come in. 

```
This is not a replacement for vol mounting 
## create a config object on the host that has the nginx.conf 

```md

## This file is created at the root of the container by default , we actually want a specific path. 
docker config create nginx-conf /tmp/nginx.conf 

## This config file is accessible by all swarm nodes across the cluster

## So you create a service 

docker service create --replicas=4 --config nginx-conf nginx 

## speciifying in a defined path 

docker service create --replicas=4 --config= src=nginx-conf, target="/etc/nginx/nginx.conf" nginx 


## remove a config from a service 
docker service update --config-rm nginc-conf nginx

docker config rm nginx-conf 

## rotate the config object for a service, only available in docker swarm 
 docker config create nginx-conf-new /tmp/nginx-new.conf 

docker service update --config-rm nginx-conf --config-add nginx-conf-new nginx 


```

