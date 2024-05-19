## Ubuntu common commands for running docker 
```md
## start as a service
- systemctl start docker
- systemctl status docker
- systemctl stop docker

## start manually for debugging
These commands are run in place of systemctl service, when a debug is needed and when troubleshooting is done manually 

- dockerd  
- dockerd --debug

## docker cli configured to interact with a Unix Socket(an ioc)

/var/run/docker.sock
```

## Make communication with docker.sock outside docker host


```md
## Done by opening a TCP connection like this
## Be very careful if your host is public facing, no auth required.
## The default does not open a TCP connection, hence no auth
## get the IP of the docker host 

dockerd --debug \
       --host=tcp://192.168.1.10:2375

## On the host that wants to connect to the Docker host 

export DOCKER_HOST="tcp://192.168.1.10:2375"

docker ps 

```
## To create TLS Encriyption

```md

## for tls cert the standard port for docker is now 2376 
dockerd --debug  \
        --host=tcp://192.168.1.0:2376 \
        --tls=true \
        --tlscert=/var/docker/server.pem \
        --tlskey=/var/docker/serverkey.pem


```

## Image reference - TCP Socket 

#### image raw reference:
```md
https://github.com/sheyijojo/Docker_CERT.git


`![alt text](https://github.com/[username]/[reponame]/blob/[branch]/image.jpg?raw=true)

```

`
## Image - TCP Socket

![TCP](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/tcp_socket.png?raw=true)


## Optionally add the dockerd parameter in daemon.json config file 

```json

{

"debug": true,
"host": ["tcp://192.168.1.10:2376"]
"tls": true,
"tlscert": "/var/docker/server.pem",
"tlskey": "/var/docker/serverkey.pem"
}

# This is also passed through if we use docker as as a service 

systemctl start docker 

```
