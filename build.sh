#!/bin/bash

name="-t himanshuchaudhary/http-akka-project"
export tag="$(git log -1 --format=%h)"
file="-f /home/knoldus/dockerCapstone/Dockerfile"
context="/home/knoldus/dockerCapstone/"
user="-u himanshuchaudhary -p himanshu123@A"

docker build $name:$tag $file $context
docker login user
docker push himanshuchaudhary/http-akka-project:$tag