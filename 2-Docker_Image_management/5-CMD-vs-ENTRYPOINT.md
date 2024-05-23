![CMD](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/CMD_ex1.png?raw=true)

A container only lives as long as the container inside it is alive. 

```md
CMD- command defines the program that will run in the container  
## for nginx
CMD["nginx"] - defines the program that will run 

## for mysql
CMD["mysqld"]

```
![CMD_bash](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/CMD_ex1.png?raw=true)

```md
## running bash as a command
Here the container started and exited because bash expects a terminal to be attached to keep running.

By default, docker do not attach a terminal to a container.


## specificy a diff command to start the container 

//appends the command and it overrides the CMD in dockerfile

docker run ubuntu [COMMAND]
docker run ubuntu sleep 5

//runs for 5secs and then exit 
## To make this permernent, write it inside the Dockerfile
FROM Ubuntu

CMD sleep 5

or 

CMD command param1
cmd["COMMAND", "param1"]

CMD sleep 5
CMD ["sleep", "5"]

command/executable = sleep
parameter = 5
```

## ENTRYPOINT
Specify default executable.

```md
# we could specify a sleeper image to sleep for 10mins instead of 5
docker run ubuntu-sleeper 10


## or we specifiy this in an Entrypoint 

ENTRYPOINT["sleep"]


//it runs when the container starts
//10 gets appended to sleep during execution

//for CMD, the command line parameter passed will get replaced entirely, but for ENTRYPOINT it gets appended. 



## if you run 
docker run ubuntu-sleeper
//it throws an error missing operand 

## so what is done to make sure a default value is set

use both the CMD and ENTRYPOINT

//the CMD instruction will be appended to the ENTRYPOINT instruction 
```


```md
FROM Ubuntu

ENTRYPOINT["sleep"]

CMD ["5]

## docker run ubuntun-sleeper 10
This will still overide the ENTRYPOIINT and CMD instruction

```