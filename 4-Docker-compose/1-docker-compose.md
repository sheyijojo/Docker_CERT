## docker compose
`docker-compose logs `

`docker-compose down`

`docker compose ps`

`docker-compose up --detach`

`docker-cmpose up -d`

![cpu_usage](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/docker_cmpose.png?raw=true)

```md
## complex app running multiple services
Easier to run and maintain. This compose is only applicatble to running containers on a single docker host

## Apps with port

Apps that have ports have a web interface, why does with no port forwarding do not have 

docker run -d --name=myapp -p 5000:80 voting-app

## how do will link these applications together 
links used on the terminal is deprecated 

```

```md
### In the yaml file for docker compose file

## The key is the image, and the value is the name of the image 

redis:
  image:redis
vote:
  image: voting-app
  ports:
    - 5000:80
  links:
    - redis

## bring it up
docker compose up 

## insturct docker to build an  image 
redis:
  image:redis
vote:
  build: ./vote
  ports:
    - 5000:80
  links:
    - redis
result:
   build: ./result
   ports:
     - 5001:80
   links:
     -  db
```

## Demo
```md
## Python - App
## Nodejs - App
## Redis
## PosgreSQL
## .NET - App

clone the source code repository and deployed it 


```
## Improving Docker Compose File 
### In version 3, if all applications are under a service in docker-compose file, it creates a network and bind these containers under the network created. 


### It alod does DNS resolution,, no need for link because they can commmunicate eith each other.  

### Both the voting app and worker app are dependent on the DB. DB is specified to have a suprer user configured b4 startup
```Dockerfile
## specify version of the dockerfile 

version: "3"
services:
  redis:
      image: redis 
  db:
    image: postgres:9.4
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
  

  vote:
   image: voting-app
   ports:
     - 5000:80
  
  worker:
    image: worker-app

  result:
    image: result-app
    ports:
     - 5001:80 



##
docker compose up 

## project name

the dir you are in will determine the name 


```