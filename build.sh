#!/bin/bash

name="-t himanshuchaudhary/http-akka-project"
export tag="$(git log -1 --format=%h)"
file="-f /home/knoldus/dockerCapstone/Dockerfile"
context="/home/knoldus/dockerCapstone/"

docker build $name:$tag $file $context
sudo cat /home/knoldus/capstone/my_password.txt | docker login "--username" himanshuchaudhary "--password-stdin"
docker push himanshuchaudhary/http-akka-project:$tag