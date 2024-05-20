![CMD_Docker](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/image_tag.png?raw=true)

```md
docker image ls

## search an images

docker search httpd

## search for dockerhub images
docker search httpd --limit 2

## search for images with 10 stars rating
docker search --filter stars=10 httpd

## officially published
docker search --filter is-official=true httpd

## docker image pull httpd
This is acutally the same as 

httpd/httpd

httpd is the account name

httpd is the repo name 


```
## authenticate in docker
```md
## authenticate into docker public registry
docker login docker.io

## authenticate into docker privateregistry

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
if you remove the custom tag, this will not delete the otherimage the custom tag is created from.


## delete all unused images, good for dev

docker image prune -a

```