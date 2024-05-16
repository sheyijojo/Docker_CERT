## Docker throttling limit 
`https://aws.amazon.com/blogs/containers/advice-for-customers-dealing-with-docker-hub-rate-limits-and-a-coming-soon-announcement/`

## Dokcer SetUp Ubuntu
- See installation instruction on a docker website

## Check all info of Docker on Ubuntu
- `sudo docker system info |more`


## Docker Engine Architecture

Docker Daemon is responsible for the networks
- The `OCI(Open Container Initiaves)` brought structure to runtime spec and image spec.
- Just like howthe lifecycle of how container to be. 
- `Docker Daemon` manages the images, volumes, and networks
- `Containerd`- manages the containers
- `containerd-shim`- ensures container runs of daemon fails
- `runC`- run container

## 4 primary objects Docker manages:
1. Images
2. Networks
3. Containers
4. Volumes 

## Containers are emphemeral,but ..
- Volumes help persist data incase there is a restart of the container.