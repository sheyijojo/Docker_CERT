## Publishing ports 
```md
## How can a user access the application running in docker?

remember running   `docker run webapp`

application is running on http://0.0.0.0:5000/

## Do we either use ip of the docker container or the docker host
remember ip of the container is internal and it needs to be mapped to that of the host.

The internal ip of the container is only accessible from the docker host, only if the docker host has a browser.

## for user to access
use the docker host ip and map the docker container ip to a free port in the docker host 

## map port 80 of the local host to 5000 of the container 
docker run -p 80:5000 webapp

##if the ip of the docker host is 192.168.1.5:80
traffic from outside will be routed to http://192.168.1.5:80


## can run multiple instances of app

docker run -p 8000:5000 webapp
docker run -p 8001:5000 webapp

## default is to run docker in all available netwrok in all interface
docker run -p 80:5000 webapp

## to limit to a specific network like internal network 
docker run -p 192.168.1.5:80:5000 webapp


## Capital P option
## what if dont specify the port when running the command, how does it know which port to map

docker run -P frontend/webapp


## it knows this port app will be running on from the Dockefile
## and publsihes the port on a random host within a limited range 


FROM unbuntu:16.04
RUN apt-get update && apt-get install -y python python-pip
RUN pip install flask
COPY app.py /opt/
ENTRYPOINT flask run
EXPOSE 5000


## expose extra ports in the container

docker run -P --expose=8080 frontend/webapp

## check all the exposed ports in ExposedPorts
docker inspect frontend/webapp
```

## DEMO


```md
docker container run-itd --name=webapp --hostname=mycompany --rm ubuntu 

docker container ls -l

## check the hostname
docker exec -it webapp hostname

## log into the container

docker exec -it webapp /bin/bash 


```

## In production use the small p for statuc port assignment 