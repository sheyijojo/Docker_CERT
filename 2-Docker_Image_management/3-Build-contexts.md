## Docker Deamon remote, dockerfile, access to files

Docker deamon can run a seperate host while the cli run on different host

We can access the daemon using ENV variables earlier mentioned

## The build context
These are the files and logs, and other thing that add uup when the build is run

Ensure you only allow neccessary files in the build context in the same dir

## Dockerignore file

.dockerignore file can be added to ensure some logs build or tmp files are not added to the build 
```md
## if run a docker buildn from a remote cli
the file is transferred from the docker cli to a temp directory

/var/lib/docker/tmp/docker-builderXXX

This is also the same if the docker daemon is on the same host

## you can specify the url to a code repository for your build context nfor Dockerfile
docker buld https://github.com/myaccount/myapp
docker build https://github.com/myaccount/myapp#<branch>
docker build https://github.com/myaccount/myapp:<folder>


## another version for dev env
docker buld -f Dockerfile.dev https://github.com/myaccount/myapp

```
## caching

```md
## chache busting technique 
 it is recommended to run RUN updates on a single line instructions like this in order to pull the latest updates 


RUN apt-get update && apt-get install -y \
    python \
    python3-pip \
    python-dev

## Version pinning 

RUN apt-get update && apt-get install -y \
    python \
    python3-pip=20.0.2 \
    python-dev
```
## Order matters

```md
Instructions related to the most frequently modified code should ebe at the BOTTOM of the dockerfile while less frequently should be UP. 

```

