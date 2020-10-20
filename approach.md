# Approach for execution of CICD:

## Files created:

### Jenkinsfile: 
It contains a pipeline script for multiple stages of deployment, testing and production.
It has build instructions for building a docker image and pushing it to dockerhub repository.

### Dockerfile:
It is a basic dockerfile which is used to build a image of http-akka. 

### deployment.yaml:
It takes the image from the dockerhub registry and deploys it to the GKE cluster.


## Procedure:
1. With each commit, the build is triggered in jenkins.
2. In development stage, code is compiled.
3. In testing stage, code is tested against several test-cases for errors.
4. In packaging stage, jar file is created. 
5. In build-image stage:
    (a)Docker image is tagged with the git commit hash.
    (b)Docker image is pushed to private docker hub registry.
    (c)Mail is sent as a post action that image is pushed to docker registry.
6. In production stage:
    (a)Image is retieved and deployed to GKE use deployment.yaml file through kubernetes.
    (b)Workspace is cleaned.
    (c)Mail is sent as a post action to check the status of tasks.
