## Multistage buILD 

```md

## There are thoe stages
1. Build
2. containerize it 
## for node js application, we build it with 

npm run build 

## to containerize
1. A dockerfile
FROM nginx
COPY dist /usr/share/nginx/html
CMD["nginx", "-g", "daemon off;"]

2. docker build -t my-app .
//Now we have containerize our app


## Note
The build package happens locally on the dev server,using the packages and lib on the server at that time and it is subject to chang or outdated

You may run into issues and clean build is not guaranteed 

## Better approach

use docker as the build process

FROM node

COPY . .
RUN npm install
RUN npm run build 


//This is what is refered as multistage build 
```


## Multistage 

```md
## Once you see multi FROM statments, that means it is a multistage build 

//base umage for build
FROM node 

COPY . .
RUN npm install
RUN npm run build AS builder

//base image for server
FROM nginx

//copy image from the previous build and not from the local host
COPY --from=builder dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]


// COPY --from=0 dist /usr/share/nginx/html

// you can use 0, o here rep the build


## to specify a particular build stage use this

docker build --target builder -t my-app .
```