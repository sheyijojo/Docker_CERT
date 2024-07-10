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

![nodeport](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/service-definition.png?raw=true)

## service defintion with pod definition file 

![service2](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/service2.png?raw=true)
```md
Nodeport service is very easy. It is easy to configure and requires a servi
## take the label from the pod defintion into the service defintioon


apiVersion: v1
kind: Service
metadata: 
    name: myapp-service
spec:
   type: NodePort
   ports:
     - targetPort: 80
       port: 80
       nodeport:3008
   selector:
      app: myapp
      type: front-end 

kubectl create -f service-definition.yaml 

kubectl get services

curl 
```
## serivce with one pod
![service3](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/service3.png?raw=true)


## What if we have multiple pods?
```md
## They all have the same label and used as selcetor during the creation og the service. 

You do not need any other configuration to makethis happen using a random algorithm for load balancing. 


## if using minikube

minikube service myapp-servicename --url 

```