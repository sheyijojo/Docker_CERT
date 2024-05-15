## By default, when docker is installed

`ls /var/lib/docker/`

`ls -lrt /var/lib/docker/`

`ls -lrt /var/lib/docker/containers/`

Here you find the ID of the containers created and can be used to debug in linux host. 

You will see all the files of the container. 

## Docker Objects 
- Volume
- Networks 
- Containers
- Images 

```bash
docker image ls

docker container ls

docker volume ls

docker network ls 

## run a container
docker container run -it ubuntu 

## build an image 
docker image build .

## Attach to a running container

docker container attach ubuntu

## stop a container

docker container kill ubuntu 

```

## More commands follwoing the new convection above

```bash
# create a httpd container without running it 

docker container create httpd 

## list all running containers

docker container ls 


## running or not 
docker container ls -a 

## last created container details
docker container ls -l

## short running container 
docker container ls -q

## all running, stopped container 
docjer container ls -aq

```

