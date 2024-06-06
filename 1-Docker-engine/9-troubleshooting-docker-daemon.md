## General troubleshoot issues 

```md
docker ps 

## if a host wants to connect to DOCKER host remotely

export DOCKER_HOST="tcp://192.168.1.10:2375"


port 2375 for uncrypted traffic

port 2376 for encrypted traffic 
```


```md
## view logs in linux

journalctl -u docker.service

## check if the debug: true, i.e if it is set to true 

/etc/docker/daemon.json

## Docker also stores all the files in this directory

/var/lib/docker   

## check the free space on the host
df -h

## delete container not in used

docker container prune 

docker image prune 

## if the service is up
docker system info 

docker system events

## high level view if debug is not set to true 

docker run -itd --name=webapp ubuntu 
tail -30 /var/log/messages

## set to true by editing the json  

vi /etc/docker/daemon.json

{
  "debug": true
}

systemctl reload docker 

docker system info 
```

## Logs reset

![Docker cp](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/aws_logs.png?raw=true)

```md
## can set the default logs to awslogs for cloudwatch events 

All containers will start using the logging driver of aws logs if it is set like this below

{
"log-driver": "awslogs",
    "awslogs-region": "us-east-1"
}

## you will need to specify the AWS key and ID as env variable 

## speficy logging driver as json file for one single container 

docker container run --log-driver json-file nginx

docker container inspect nginx 

docker container inspect -f '{{.HostConfig.LogConfig.Type}}' nginx

docker system info | grep -i "logging driver"
```
