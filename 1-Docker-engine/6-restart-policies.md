![Docker Policies](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/docker_restart_policies.png?raw=true)

```md
# anytime I see an exit of 1
exit code of 1 means FAILURE 

exit code of 0 means SUCCESS

## Sometimes, we want our container to restart immediately even if some processes are stopped intermitently 

docker container run --restart=always ubuntu 
docker container run --restart=on-failure ubuntu 
docker container run --restart=no ubuntu 
docker container run --restart=unless-stopped ubuntu 

## This commands are applicable if the container starts successfully at the first place, and it is up at least 10secs, we do not want to go into restart loop
```

## Docker host runs the Docker Daemon service 
```md
## What happens if this service fail?

## i.e if this process stops and the deamon is not running?
docker daemons pulls the image and starts the container 

if deamon goes down, it takes the container with it 

## can configure the docker daemon with live restore and not to take down the container

## configure in the /etc/docker/daemon.json

{

"debug": true,

"host": ["tcp://192.168.1.10:2376"],
"live-restore": true
}

## systemctl start docker

docker container run --name webapp httpd 

So if the daemon stop, container will continue running 

```