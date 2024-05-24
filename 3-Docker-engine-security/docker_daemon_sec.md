## Docker Daemon Security

`https://excalidraw.com/`

## If they gain access to the Docker Deamon(server)

```md
- Delete existing containers
- Delete vols
- Run containers to run their apps
- Gain root access to the HOST system by running a priviledge container
- Target other systems in the network 

## By default docker daemon service
By default, docker exposes the docker daemon service within the host only on a UNIX socket. 

`/var/run/docker.sock`


Remember, we are talking about docker daemon service and not the app that docker deployed


```
## How it works
```md
Only those logged in to the host has access to the docker service

## first level of security
- secure the host with best practices
- disabling root user
- disabling password auth
- enforcing SSH key-based auth
- disabling unused port ...etc


## Configuring external access to the Docker Deamon
Sometimes you may need external access to the docker Daemon from another host, or a user's laptop

//This must be done only if is absolutely neccessary 


## Steps

1. Add "host":["tcp"//192.168.1.10:2375"] to /etc/docker/daemon.json
2. Make sure you expose this service to private networks within our org
3. If the org does have a public facing interface, ensure the docker host is not exposed on those interfaces. 
4. secure TLS certificate server.pem, amd serverkey.pem and palace it in `/var/docker/server.pem` and `/var/docker/serverkey.pem`
5. the host port will now be 2376
6. in the remote system, you can now target the docker api server by `export DOCKER_HOST="tcp://192.168.1.10:2376", also DOCKER_TLS=true



## For authentication
Use certificate based authentication 
1. copy the cacert.pem to server side, set the 
2. "tls_verify":true  
3. "tlscacert": "/var/docker/caserver.pem"
4. Generate cert on the docker host for client to connect. clientkey.pem, client.pem and the cacert.pem to be sent to the client
5. `export DOCKER_TLS_VERIFY=true`
6. use command or docker in the $HOME directory of docker of the client 
7. docker --tlscert=<>  --tlskey=<>  --tlscacert=<> ps


## Now only clients with tls cert can access the daemon 
```

## Summary 

![TLS_summary](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/tls_summary.png?raw=true)