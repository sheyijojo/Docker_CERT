## Create an image for a simple web app
![custom image](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/custom_image.png?raw=true)
```md
first have the steps if you were to run it manually

OS - Ubuntu
Update apt repo
install dependencies using apt
install Python dependencies using pip
copy source code to /opt folder
run the webserver using "flask" command
```

## Dockerfile
```Dockerfile
FROM Ubuntu

RUN apt-get update && apt-get -y install python

RUN pip install flask flask-mysql

COPY  . /opt/source-code

ENTRYPOINT  FLASK_APP=/opt/source-code/app.py  flask run

## build the image

docker build . -f Dockefile -t myrepo/imagename-tag

docker push myrepo/imagename-tag

```
## Key point - -y, image, dockerfile
```md
Every `Dockerfile` is based off of an image, either an OS image or an image created before based on an OS.

## always use non interactive like -y, else the build will fail

RUN yum -y update 

RUN yum -y install httpd 

## in the same dir
Our code should be in the same dir as our dockerfile 
```


## Example of Docker for Tomcat Image 

```dockerfile
## tomcat 

FROM centos:7

ARG tomcat_version=8.5.6

RUN  yum install -y epel-release java-1.8.0-openjdk.x86_64 wget
RUN groupadd tomcat && mkdir /opt/tomcat

RUN useradd -s /bin/nologin -g tomcat -d /opt/tomcat tomcat

WORKDIR /

RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v$tomcat_version/bin/apache-tomcat-$tomcat_version.tar.gz

RUN tar -zxvf apache-tomcat-$tomcat_version.tar.gz -C /opt/tomcat --strip-components=1

RUN cd /opt/tomcat && chgrp -R tomcat conf

RUN chmod g+rwx /opt/tomcat/conf && chmod g+r /opt/tomcat/conf/*

RUN chown -R tomcat /opt/tomcat/logs/ /opt/tomcat/temp /opt/tomcat/webapps /opt/tomcat/work

RUN chgrp -R tomcat /opt/tomcat/bin && chgrp -R tomcat /opt/tomcat/lib && chmod g+rwx /opt/tomcat/bin && chmod g+r /opt/tomcat/bin/*

WORKDIR /opt/tomcat/webapps

RUN wget https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war
EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh","run"]

```

## Explanation of the Dockefile 
```md
1. Centos-  is the base image for the Tomcat 
2. ARG - A variable inside the docker file, used to specify the version of the base image
3. RUN - is used to execute some instructions
4. WORKDIR - changes the path in the container
With this WOKRDIR, it changes the path to the 
container and makes it the current DIR.

## In my view
It is like we want diff paths for new installations for tomcat. The prev installations were for the base image I think.

## Where is the default location for yum install?

5. WORKDIR - This change the tomcat /opt directory in order to run some commands 


## Build the image
docker image build -t repo/tomcatone:v1 .

//Make sure you specify the repo and image name like this. 

## create a container
docker container run -itd --name=imageteestin -p 84:8080 repo/imagename:v1

## check for your ethernet and ip
ipconfig


```
## Update the file to a new version , we are reusing the dockerfile

```md
just change the ARG
ARG tomcat_version=8.5.8 on the terminal or file

## on terminal 
docker image build -t  Repo/tomcatone:v2 --build-arg tomcat_version=8.5.8 .

## you can go inside the container
docker container exec -it nameofcontainer /bin/bash
```




