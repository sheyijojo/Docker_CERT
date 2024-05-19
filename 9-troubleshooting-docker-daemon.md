## General troubleshoot issues 

```md
docker ps 

## if the a wants to connect to DOCKER host remotely

## export DOCKER_HOST="tcp://192.168.1.10:2375"


port 2375 for uncrypted traffic

port 2376 for encrypted traffic 
```


```md
## view logs in linux

journalctl -u docker.service

## check if the debug: true 

/etc/docker/daemon.json



## Docker also stores all the files in this directory

/var/lib/docker   ##

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

## edit the 

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

All containers will use the logging driver of aws logs 

{
"log-driver": "awslogs",
    "awslogs-region": "us-east-1"
}

## you will need to specify the AWS key and ID as env variable 

## speficy logging driver for one single container 

docker container run --log-driver json-file nginx

docker container inspect nginx 

docker container inspect -f '{{.HostConfig.LogConfig.Type}}' nginx

docker system info | grep -i "logging driver"
```
