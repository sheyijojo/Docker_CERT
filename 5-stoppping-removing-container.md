## Stopping and removing containers

![CMD_Docker](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/docker_cmd_sample.png?raw=true)



```md

## CMD is httpd-foreground
`This is the command executed when docker is started `



## Linux signals to PAUSE a signal
kill -SIGSTOP 11663
//11663 is the ID of the process 


## if you do not know the id 
kill -SIGSTOP $(pgrep httpd)


//This pauses the processes, although its state is preserved to be resumed later

## to resume
kill -SIGCONT $(pgrep httpd)

## Whine down and terminate 
kill -SIGTERM $(pgrep httpd)


## Immediately terminate signal
kill -SIGKILL $(pgrep httpd)
```


## Docker pause, resume, kill proceesses

```md
docker container run --name web httpd

docker container pause web

docker container unpause web

docker container stop web 


## Can pass a specific signal to a process

docker container kill --signal=9 web

```

## Remove a container permanently

```md
## first stop 
docker container stop web 
## remove
docker container rm web

## list running docker container ids only

docker container ls -q

## use this nice linuxcoommand to stop all running at once 
docker container stop $(docker container ls -q)

## remove all at once
docker container rm $(docker container ls -a)

## OR use prune to rm all stoped containers
docker container prune 

## We may not require to stay running after execution 
docker container run --rm ubuntu expr 4 + 5
```

## Inside the container
```md
## check with process is running 

ps -ef

## inside the container 
docker exec -it 9f232242222 hostname

docker exec -it 2429u23sd03q cat /etc/lsb-release 


## Relogging into the container using /bin/bash, a new process created by me 

docker container exec -it 9f23223239 /bin/bash

## Be carefule with attach

it replaces the original process, so if you type exit, it kills the container 
```