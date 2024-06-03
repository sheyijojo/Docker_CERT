## docker compose

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
###in the yaml file for docker compose file

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
edis:
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




```
