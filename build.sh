#!/bin/sh

name="-t himanshuchaudhary/http-akka-project"
tag="$(git log -1 --format=%h)"
file="-f ./Dockerfile"
context="./context"

export tag

cp ./target/scala-2.11/akka-http-helloworld-assembly-1.0.jar ./context

docker build $name:$tag $file $context

docker push himanshuchaudhary/http-akka-project:$tag