FROM openjdk:8

WORKDIR ~/http-akka-example
COPY akka-http-helloworld-assembly-1.0.jar .
EXPOSE 8080
CMD ["java","-jar","akka-http-helloworld-assembly-1.0.jar"]
