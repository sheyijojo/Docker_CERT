## Namespaces in Kubernetes 
![k8_demo2](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/demo2.png?raw=true)

## Namespaces 

![ns](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/namespace.png?raw=true)
```md
## What are Namespaces 

All the objects created so far as been created in a namespace known as the default namespace, which is created automatically by k8/kubernetes.


## Kube-system namespace

k8 creates a set of pods and services for its internal solutions such as DNS services..to isolate it from the user 

## kube-public
where resources for the outside world are stored.

## you can create ns for dev and prod 
Isolate resources from dev and prod 
They can have different policies applicable to each one.

you can apply resource limits 

## connect from one namespace to another 
mysql.connect("db-service")
mysql.connect("db-service.dev.svc.cluster.local")
test
- cluster.local - default domain name for the cluster 
- svc - service
- dev - Namespace
- db-service - Service Name 


```

## Namespace Ops

```md
## pods in the default ns
kubectl get pods

## list ns in kubesys ns
kubectl get pods --namespace=kube-system

## create pods in a particular ns
kubectl create -f pod-definition.yml --namespace=dev

## OR make sure a pod gets created in the dev ns all the time 
move the namespace into metadata parameter area 

```

![ns_2](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/ns-2.png?raw=true)

## Creating Namespace
```yaml
apiVersion: v1
kind: Namespace
metadata: 
    name: dev

##run the command
kubectl create -f namespace-dev.yaml


## Or create the namespace this way
kubectl create namespace dev 

## switching namespace permanently on this context 

## deep into context is a seperate video

kubectl config set-context $(kubectl config current-context) --namespace=dev 

kubectl get pods

## view pods in all namespaces 
kubectl get pods --all-namespaces 

## limit a resource in a namespace by creating a quota 
apiVersion: v1
kind: ResourceQuota
metadata: 
    name: compute-quota
    namespace: dev

spec:
  hard:
    pods: "10"
    requests.cpu: "4"
    requests.memory: 5Gi
    limits.cpu: "10"
    limits.memmory: 10Gi
```


## CMD and ARG in Kubernetes 
![ns](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/k8_CMD_ARGS?raw=true)


The command field overides the ENTRYPOINT instruction in the Dockerfile


command in k8 ==> ENTRYPOINT in Dockerfile

The args filed overides the CMD instruction

args in k8  ==> CMD in Dockerfile 




```yaml
apiVersion: v1
kind: Pod
metadata:
 name: ubuntu-sleeper-pod
spec:
  containers:
     - name: ubuntu-sleeper
       image: ubuntu-sleeper
       command: ["sleep2.0"]
       args: ["10"]

```

## environment variables in Kubernetes


```yml

```

![config](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/config-map.png?raw=true)
