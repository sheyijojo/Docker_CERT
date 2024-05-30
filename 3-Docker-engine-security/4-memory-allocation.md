## Resource Limits Memory 
```md
## How memory works in a linux system 
Unless limted, a process can use enough memory as available on a phydical RAM on a linux host 

## SWAP Space
If all the physical memory is used up, Linux starts using up the additional SWAP space for additional memory 

## SWAP space is a dedicated space on the Disk not RAM
Can be used temporary as RAM or MEM

## OOM - Out of Memory Exception
If memory is out of a system it throws out this error
- It starts killing processes to free up memory 


## Restrict memory usage for a container 
docker container run --memory=512m webapp 

//It also allows the container to use the same amount of 512 memory as swap space if enabled on the host. ~ 1GB i.e total memory + swp == 1GB

## limit the amount of SWAP space 
docker container run --memory=512m --memory-swap=512m webapp 

## since both numbers are 512
There is no swap space configured

512 - 512  = 0

## set the swap space to 256
docker container run --memory=512m --memory-swap=768m webapp 

## swap space value
768 - 512 = 256
```

## Out of Memory and out of CPU

```md
## In CPU you can throttle and limit the CPU 
A container is not killed, it is throtthled if it attempts to use CPU more than the specified usage

## In Memory, no option to throttle
Container is killed with OOM exception 


```

## Demo
```md

## Demo

docker container run -itd --name=webapp ubuntu

## memory is 0, i.e no restriction 

docker container inspect webapp | grep -i mem

## set swap to unlimited during container creation

docker container run -itd --name=testcontainer --memory=200m --memory-swap=-1 ubuntu 

## soft limit for min requirement purpose

docker container run -itd --name=testfour --memory=200m --memory-swap=-1 --memory-reservation=100m ubuntu 
## cpu
doker container run -itd --cpus=1 --name-testcpuone ubuntu

## lock container to cpu core name 1

docker container run -itd --cpuset-cpus="1" --name-testcputwo ubuntu 


```
