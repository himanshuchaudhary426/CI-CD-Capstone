tag="$(git log -1 --format=%h)"

kubectl set image deploy/http-akka http-akka-example=himanshuchaudhary/http-akka-project:$tag