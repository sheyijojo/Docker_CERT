## Pre-Requisite Network Namespaces

![namspace](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/process_namespace.png?raw=true)
```md
Network namespaces are used by linux to implement isolation. 

Process ID in the container and on the host give different values.

```
## What are namespaces
```md
## Creating a container
When you create a container, you want to ensure it does not have access to other processes within the host. 


We create a special room for it using namespace 

## list processes on a host and container 
ps aux

## root for e.g
The root process in the container and on the host are quite different 

## for networking
Our host has a diff interface that connects to the LAN

We create a room(namespace) for our container to prevent having any information about the networking of the host.

Within the container namespace, we have  its own virtual interface, routing and ARP tables. 
```



```md
They are usually used by docker to implement network isolation 
## Analogy
If host is the house, then namespaces are the rooms within the house. 

You should know, containers are seperated from the underlying host using namespaces 
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

## execute the ip link to get the interface in the container  within the namespace called red 

ip netns exec red ip link 

ip -n red link 

## The above two commands are the same..... 
Note: the interfaces of the host will be seen within this red namspace, because we have successful prevented the container from seeing the eth on the host. 

## ARP
The ARP (Address Resolution Protocol) table is a data structure used to store mappings between IP addresses and MAC (Media Access Control) addresses. 


This table is maintained by network devices, such as computers and routers, to efficiently manage the conversion of network layer addresses to data link layer addresses, which is essential for communication on a local network.


## run ARP on the host to see entries

arp

## run inside the ns in container
ip netns exec red arp 



## Establishing connectivity between the namespaces
- using a virtual ethernet pair or a virtual cable aka pipe

ip link add veth-red type veth peer name veth-blue 

## attach each interface to their namespaces
ip link set veth-red netns red 
ip link set veth-blue netns blue 

## Assign ip addr to each namespace
ip -n red addr add 192.168.15.1 dev veth-red

ip -n blue addr add 192.168.15.2 dev veth-blue 

## bring up the interface

ip -n red link set veth-red up

ip -n blue link set veth-blue up 

## ping from the red namespace to the blue ns 
ip netns exec red ping 192.168.15.2

## list arp of the blue and red vice versa
ip netns exec red arp

ip netns exec blue arp 

## list for the host, it will have no idea of the value of the namespaces

arp

## What happens when you have multople namespaces, and how do they communicate 

create a virtual network called a switch within the host and connect the ns to it. 

- can use linux bridge or Open vSwitch

## using linux bridge 
1. Add a new interface to the host to serve as the bridge 
ip link add v-net-0 type bridge 

## As far as the host is concerned, it is another interface created, i mean the linux bridge 

## check for the newly created interface 
ip link 


## bring the interface up
ip link set dev v-net-0 up

Think of this as an interface for the host and switch for the namespaces. 

## connect the namespaces to the switch 
we are not connectiing the pair of ns like I did earlier, we are connecting all the namespaces to a virtual network for connectivity. 

## we need new cable 

- get rid of the initially created cable 

ip -n red link del veth 

## create a new cable called veth-red-br, linking a ns to a cable 
ip link add veth-red type veth peer name veth-red-br

## the veth-red-br is the bridge network 


##  create a new cable and add the blue ns to the cable
ip link add veth-blue type veth peer name veth-blue-br 

## attach one end of the interface to the red ns
ip link set veth-red netns red 

## attach the other end to the bridge network
ip link set veth-red-br master v-net-0 


ip link set veth-blue netns blue
ip link set veth-blue-br master v0net-0 


## set ip kink for these links 
ip -n red addr add 192.168.15.1 dev veth-red
ip -n blue addr add 192.168.15.2 dev veth-blue


## set it up
ip -n red link set veth-red up

ip -n blue link set veth-blue up

All four interfaces are connected to the bridge network 

```
![bridge_net](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/bridge_net.png?raw=true)

```md
## try to ping from  the host to the ip addr
ping 192.168.15.1

it wont work 

## if we want to access the ns through the bridge network which is an interface, we need to assign an ip addr to it 

ip addr add 192.168.15.5/24 dev v-net-0

The only door to the LAN is through the internet port on host 

## add an entry to provide gateway to outside work 
our local host is the gateway that connects the private network of the ns and the outside world

## for blue ns, add a route entry to establish connectivity for gateway
ip netns exec blue ip route add 192.168.1.0/24 via 192.168.15.5

## if you ping an ip addr outside, it will go, but no response back 

You need NAT enabled as our gateway to send network traffic to LAN with its own name and IP addr

iptables -t nat --A POSTROUTING -s 192.168.15.0/24
```