## Kubernetes Networking 
```md
## Let us consider a single node cluster
The node will have an IP address assigned to it to ssh into it 
- The POD will also have an internal IP address attached to it 


## How do pods get their IP address
When k8 is initially configured, we have an IP addrr of 10.224.0.0 , and all pods will be attached to this network.

Each pods get a seperate IP 

- 10.244.0.3
- 10.244.0.2
- 
Each pods can communicate with each other. However, the ip is subjected to change when pods are recreated, so not a good idea. 

## Better way coming 

## What about multiple nodes?
Ip conflicts could occur if two pods from two diff nodes have the same internal IP. 


## Kubernetes Netw

k8 expects us to setup networking to meet fundamental requirements.

 All containers/PODS can communicate with each other without NAT 

All nodes can commincate with all containers and vice-versa without NAT. 

```
![k8_netwrking](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/k8_netwrk.png?raw=true)

## Setting up the Networking

```md
## Fortunately we do not need to set up by ourselve 
Multiple pre-built solutions available 
- cisco
- flannel
- vmware
- - clium 
- NSX


```

![k8_netwrk2.png](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/k8_netwrk2.png?raw=true)
