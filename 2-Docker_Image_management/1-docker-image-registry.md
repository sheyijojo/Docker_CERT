![CMD_Docker](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/image_tag.png?raw=true)

```md
docker image ls

## search an images remotely

docker search httpd

## search for dockerhub images with a limit 
docker search httpd --limit 2

## search for images with 10 stars rating
docker search --filter stars=10 httpd

## officially published images
docker search --filter is-official=true httpd

## docker image pull httpd
This is acutally the same as:

docker image pull httpd/httpd

`httpd is the account name`

`httpd is the repo name`


```
## Authenticate in docker
```md
## authenticate into docker public registry
docker login docker.io

## authenticate into docker private registry

docker login gcr.io 

## create a copy of an image

docker image tag oldimagename:tag newimagename:newtag

docker image tag httpd:alpine  httpd:cutomv1

docker image list 

## check the size of diff objects
docker system df 

```

## Removing image in docker

```md
## 2 images with different tags
if you remove the custom tag, this will not delete the other image the custom tag is created from.


## delete all unused images, good for dev

docker image prune -a

```

## Inspecting a Docker Image 

```md
## check diff layers of that make an image
### you will also see all the commands use to create that image, useful if do not have access to the dockerfile

docker image history ubuntu

docker image inspect httpd

## inspect with format to retrive os

docker image inspect httpd -f '{{.Os}}'


## retrieve the architecture of the image

docker image inspect httpd -f '{{.Os}}' '{{.Architecture}}'
```

## save a an image as a tar file

```md

## save image and tar it 
docker image save alpine:latest  -o alpine.tar


docker image load -i alpine.tar

## convert a container to an image 
docker export <container-name> > test.tar

docker image import test.tar newimage:latest
```


