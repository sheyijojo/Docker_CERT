## Demo - Deploy voting app on Kubernetes 
![k8_demo](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/demo-k8.png?raw=true)
```md
## Goals
Deploy containers on a K8 cluster 
Enable Connectivity 
External Access 

## Demo 2

Stages
1. Deploy as PODS
   - Enable connectivity between the apps 
2. Create Services(ClusterIP)
   - The services are not to be accessed outside the cluster, hence they must be clusterIP. ClusterIP is the default network
  1. redis
  2. db
  3. Create Services (Nodeport)
- enable external access
  1. voting-app
  2. result-app 
total of 5pods and 4 services, not service for worker pod


## kubectl get pods, svc

## Right approach is to use deployments rather than pods 
Deployments automatically creates replicaset and it contains the matchLabels. 
```

![k8_demo2](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/demo2.png?raw=true)

##

```md
## Deployments 

Will help with rolling updates and some other processes

## for this demo
What was created was actually:
- deployments.yaml
- service.yaml
- 
- 
```

