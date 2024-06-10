## Pre-Requisite Network Namespaces

![namspace](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/process_namespace.png?raw=true)


Process ID in the container and on the host give different values 
```md
They are usually used by docker to implement network isolation 
## Analogy
If host is te house, then namespaces are the rooms within the house. 

## Host
The host has its own interface eth where it connects to the local network, it also has its own ARP Table and Routing Table

## Container 
Likewise the container, when we create a new network on the container, the container has its own interface veth0, routing table, ARP table.

## to create a new network namespace on a container  on a linux host

ip netns add red 

## list 

ip netns

## list the interfaces present on my host 
ip link 

## execute the ip link to get the interface within the namespace called red

ip netns exec red ip link 

ip -n red link 

## The above two commands are the same..... 
Note: the interfaces of the host will be seen within this red namspace, because we have successful prevented the container from seeing the eth on the host. 

## run this on the host to see entries

arp

## run inside the ns in container
ip netns exec red arp 

```