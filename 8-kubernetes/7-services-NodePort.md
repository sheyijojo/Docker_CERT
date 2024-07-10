## kubernetes Services 
```md
k8 services enable commuincation between vsrious components within and outside of the appplication 

K8 services helo us connect apps together with other users or apps. 

Services enable loose coupling within our application


```
## External commucation with pod
```md
## External commucation with pod
Lets take for example that we deployed a web app on a pod, how do external users access it?

The kubernetes service is where k8 service come in plac.

It is an object just like deployment, replicaset. 
One of its job is to listen to a port on the nnode and forward request on that port to a port on the Pod running the web application.

## Type of service is a NodePort service
This is because it listens to port on the node and forwards it to the pod. 


```

## Services
![services_type](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/services_type.png?raw=true)

## services_type.png
```md
1. NodePort
2. ClusterIP - creates a virtual IP inside the cluster to enable communcation with diff services 
3. LoadBalancer - with diff cloud services 

```

## nodeport service 

![nodeport](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/services_type.png?raw=true)
