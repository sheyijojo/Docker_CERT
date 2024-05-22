## Base vs Parent Image 
Base is built from scatch

parent image is one an image is built from 

![Base Image](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/base_vs_parent_image.png?raw=true)

## can have multiple parent images
![MultipleImage](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/parent_images.png?raw=true)


```md
## base images

Most OS habve their images configured alreay, you do not need to vreate any of your own.

## This is how it looks for debian:buster-slim
FROM scratch
ADD rootfs.tar.xz /
CMD ["bash"]


```