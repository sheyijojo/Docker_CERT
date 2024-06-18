## Docker Volumn
```md
## Docker volume inspect
docker volumen inspect 

## volumn removal 

docker volume remove data_volume

docker volumn prune  

## volumns are mounted as read only be default 

docker container inspect my-container 



docker container run --mount \ source=data_vo1, destination=/var/www/html/index.html,readonly httpd


```

## Docker volumes Demo'

```md
docker volumn ls 

docker volumn create tesvol 

docker container run -itd --name=test -v testvol:/yogesh centos:7

## check vol in the conmtainer and see if it is already mounted 

docker exec -it test /bin/bash

df -h | grep -i /yogesh 

## youb can cereate and persist files in the vol location inside the container.


##, if the container is destroyed, it does not mean the vol is destroyed 



```

## use the new command, mount 


```md
docker container run -itd --name=test --mount source=testvol, destination=/yogesh centos:7


df -f | grep -i /yogesh 

```

## Bind-mount method - from another host to the container 
```md
## bind mount 

docker container run -itd  --mount type=bind,source=/data,destination=/yogesh centos:7 

## In the bind mount method, we wont be able to see a list of volumes. 

docker volume ls 
```