## Best practices 
1. Do not build images that combine multiple applications such as a webserver, database all into one 
2. Build modular images, one that solves a particular problem.
3. One for webserver and one for database.
4. Each image has its own libraries and dependencies 
5. Do not store data or state in container, they are ephemeral
6. Store in caching services like redis or volume
7. Create slim/minimal images
8. Find an official minimal image
9. only install neccessary packages 
10. For dev, we add additional tools like debug tools, in PROD, we may need to remove all these tools 
11. Use multi stages 
12. Use .dockerignore file to exclude unwanted files in the build context 

## Minimize build time
![min_buildtime](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/minimize_build_time.png?raw=true)

## When log into a registry

When you log in to a registry, the command stores credentials in which location path?

`$HOME/.docker/config.json`

## Build an Image from an existing container
`docker commit`

## You have created an nginx container and customized it to create your own webpage. How can you create an image out of it to share with others?

`docker export`

## Dockerfile in DIR
![Dockerfile_in_dir](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/docker_file_in_dir.png?raw=true)

## Get a backup of the image in tar

`docker image save mysql -o mysql.tar`

## minimize image size
![Dockerfile_in_dir](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/min_img_size.png?raw=true)