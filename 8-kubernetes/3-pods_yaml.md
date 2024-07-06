## Create pods with Yaml file 
![objects](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/root_level_objects.png?raw=true)
```md
## creating a pod with yaml based config file 
pod-definition.yaml 

## a pod definition file container 4-level fields
- apiVersion:
- kind:
- metadata
- spec

## These are the root level required fields 
apiVersion - This is the right api version e.g v1 or apps/v1

kind - tyoe of object to create e,g pod, replicaset, service, Deployment

Metadata - name, labels in the form of a dictionary. name for example is a string value, labels is a dictionary.

spec - You need to specify the image/container to be working with to create these pods. spec is a dictionsry 



## Note
You can only specify certain keywords under metadata as specified by kubernetes e.g name, labels 

However, under labels, you can have any key-value pair as you deem fit. 

## spec are different for different pods 

## run the yaml file 
kubectl create -f pod-definition.yaml 

kubectl get pods

kubectl describe pod myapp-pod 

```

## Demo 

```yaml
apiVersion: v1
kind: Pod
metadata:
    name: nginx
## keyvalue pair 
    labels:
      app: nginx 
      tier: frontend 
spec:
  containers:
  ## a list 
   - name: nginx
     image: nginx
   - name: my-second-container 
     image: python3
  
## same command works well 

kubectl create -f name-of-file
kubectl apply -f name-of-file
```
