## Cluster IP

![cluster_ip](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/cluster_ip.png?raw=true)
```md
## pods run frontend webserver
## pods run backend server
## ## pods run database server

## What is the right way to establish connectivity amongst these pods
pods have ips assigned to them and we know they are not static.


## Goruping the pods together
A kubernetes service can help group the ports together and provide a single interface to acces the pods in a group. 

## Each service gets an IP and name attached to it
This is the name that should be used by other pods to access the servic. 


## This service is known as ClusterIP
Remember clusterIP is the default type 

kubectl create -f service-definition.yaml 
```

