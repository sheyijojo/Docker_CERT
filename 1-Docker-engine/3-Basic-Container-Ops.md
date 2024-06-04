## Default location of docker in linux systems 

`ls /var/lib/docker/`

`ls -lrt /var/lib/docker/`

`ls -lrt /var/lib/docker/containers/`

```md

Here you find the ID of the containers created and can be used to debug in linux host. 

You will see all the files of the container. 


```
## Docker Objects 
- Volume
- Networks 
- Containers
- Images 

```md

## common commands 
docker image ls

docker container ls

docker volume ls

docker network ls 

## run a container
docker container run -it ubuntu 

## build an image 
docker image build .

## Attach an ubuntu to a running container

docker container attach ubuntu

## stop a container

docker container kill ubuntu 

```

## More commands following the new convection above

```md
# create a httpd container without running it 

docker container create httpd 

## list all running containers

docker container ls 


## running or not 
docker container ls -a 

## last created container details
docker container ls -l

## running container with ids only
docker container ls -q

## all running and stopped container 
docker container ls -aq

```


## Combine start and Create Container into Oone command
```md
## start a container
docker container start 232u2334223

## list container 
docker container ls 

## combined formed 

docker container run httpd 

```

## When container stops and exits

```md
## containers are not meant to host an OS like ubuntu unlike Virtual machines 

## They are meant to run a specific task and processes

## e.g to host a specific instance of a webserver, application server, database, or run a computation or analysis. 


```

## Important point about container live 
```md
# A container only lives if the process inside it is alive!

For Ubuntu stopping, Ubuntu is an image of an OS, it is used as a based image for building images of other apps. 

No process running on it by default. 

So it used as base image of other applications that are based on the ubuntu Operating system. 

It will only be alive if a process is run inside such as a `SHELL` process


```

## Ubuntu Image and SHELL
When we started an Ubuntu container, it ran a `SHELL` as a process, but did not find a terminal to associate with it, hence the process/SHELL dies. 


```md
## To make the terminal iteractive and attached
i - iteractive
t - terminal attached 

docker container run -it ubuntu 

## container is running now
In this case, what is running is the Bash shell process, hence, what is keeping the container running and alive without exiting. 

```

## Adding a flag like -i , -t
Always specify it before the image name.

Anything passed to the right of the image is passed into the container.

`docker container run -it ubuntu `


## Running exit will stop the container
runnning exit will stop the container, i.e the only running process in the conatiner in the case of Ubuntu. 

## Naming a docker container
`docker container run -itd --name=webapp ubuntu`

d - detach mode will run in the background, by default, it is attached mode

## to rerun in detach mode
`docker container attach 11cb`

## Renaming 
`docker container rename webapp custom-webapp`