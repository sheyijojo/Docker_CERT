## Diff between COPY and ADD
```md
## COPY and ADD
ADD can extract a tar file and add it to a DIR in container 

## COPY doesn not extract 

Remember it extracts and do copy the tar file
you can specify a url

## Best PRACTICE
Use the COPY for easy readability 

More instrcutions lead to more layers which lead to more size to the image. 
## Use RUN

instead of copying and Adding, you use can use RUN at once to execute all the instructions

```

![COPY_ADD](https://github.com/sheyijojo/Docker_CERT/blob/main/_assets/copy_vs_add.png?raw=true)