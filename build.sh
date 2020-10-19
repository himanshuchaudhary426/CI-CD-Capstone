#!/bin/sh

name="-t himanshuchaudhary/http-akka-project"
tag="$(git log -1 --format=%h)"
file="-f /home/knoldus/dockerCapstone/Dockerfile"
context="/home/knoldus/dockerCapstone/jarfiles"


docker build $name:$tag $file $context

docker push himanshuchaudhary/http-akka-project:$tag