## Tutorial: Deploy an application into Amazon ECS
```md
Tutorial link - https://docs.aws.amazon.com/codedeploy/latest/userguide/tutorial-ecs-deployment.html

```

## Introduction 

```md
In this tutorial, you learn how to deploy an application into Amazon ECS using CodeDeploy. 

## Start with an already existing application 
You start with an application you already created and deployed into Amazon ECS.

## 1 - modify task definition file with new tag 
The first step is to update your application by modifying its task definition file with a new tag. Next, you use CodeDeploy to deploy the update. 

## Codedeploy use the replacement task set
During deployment, CodeDeploy installs your update into a new, replacement task set. 

## Codedeploy shifts traffic to the nre replacement task set 
Then, it shifts production traffic from the original version of your Amazon ECS application, which is in its original task set, to the updated version in the replacement task set.

```

## Codedeploy uses load balancer

```md
During an Amazon ECS deployment, CodeDeploy uses a load balancer that is configured with two target groups and one production traffic listener. 

The following diagram shows how the load balancer, production listener, target groups, and your Amazon ECS application are related before the deployment starts. This tutorial uses an Application Load Balancer. You can also use a Network Load Balancer.

```

## Amazon ECS deployment 
![ecs_preDeployment](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/ECS_service_1.png?raw=true)


## After successful deployment 
```md

After a successful deployment, the production traffic listener serves traffic to your new replacement task set and the original task set is terminated.

For information about how to use the AWS CLI to deploy an application into Amazon ECS, 

## see Tutorial: Creating a service using a blue/green deployment. 

https://docs.aws.amazon.com/AmazonECS/latest/developerguide/create-blue-green.html

For information about how to use CodePipeline to detect and automatically deploy changes to an Amazon ECS service with CodeDeploy, see Tutorial:

## Create a pipeline with an Amazon ECR source and ECS-to-CodeDeploy deployment. 
https://docs.aws.amazon.com/codepipeline/latest/userguide/tutorials-ecs-ecr-codedeploy.html
```

![after_Deployment](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/after_deployment.png?raw=true)