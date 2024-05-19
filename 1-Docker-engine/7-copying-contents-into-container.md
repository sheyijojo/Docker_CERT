## Copying from the docker host to the container 
![Docker cp](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/dockercp.png?raw=true)

```md

## copy a file from host to container 
docker container cp /tmp/web.conf  webapp:/etc/web.conf

# copy from container to host 
docker container webapp:/root/dockerhost /tmp/

## can copy a whole folder

docker container cp /tmp/app/ webapp:/opt/app

```