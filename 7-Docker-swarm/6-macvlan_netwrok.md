## Network Summary 
![ingress](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/network_summary.png?raw=true)


## Default Macvlan networks 

```md
## It is another type of network

legacy app expect to directly connected to the physical networ.
Use a mcvlan network driver which assigns a MAC address to each containers virtual network interface. 

Making it appear to be a physical network 

## to create one 
docker network create --driver mcvlan -o parent=eth0 my-over-lay-network 

```