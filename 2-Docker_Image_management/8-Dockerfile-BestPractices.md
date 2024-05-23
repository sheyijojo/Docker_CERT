## Best practices 
1. Do not build images that combine multiple applications such as a webserver, database all into one 
2. Build modular images, one that solves a particular problem.
3. One for webserver and one for database.
4. Each image has its own libraries and dependencies 
5. Do not store data or state in container, they are ephemeral
6. Store in chaching service or volume
7. Create slim/minimal images
8. Find an official minimal image
9. only install neccessary packages 
10. For dev, we add additional tools like debug tools, in PROD, we may need to remove all these tools 
11. Use multi stages 
12. Use .dockerignore file to exclude unwanted files in the build context 