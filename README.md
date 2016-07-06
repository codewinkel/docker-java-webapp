# docker-java-webapp
Dockerfile for spring-boot microservices with the minimum scripts etc. you need to create a docker image.

## Procedure
* create as git submodule in your project under <project-path>/deploy/docker
* copy your files(web-archive compressed as .jar) to ./content/
* start buildDocker.sh <servicename>
* finished!!! now you have your created image

I have integrated this in my deployment pipeline of microservices.


*** WORK IN PROGRESS ***
