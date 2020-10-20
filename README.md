# Capstone project for CI/CD :- 

## Make a jenkins multibranch pipeline project.

### Scenario: Madhukaraphatak is a scala developer developed some code which is running fine on his local and wamt you to streamline his work using devops methodologies, Your job is to create CI-CD for him so that he just have to code and push to github and rest of the things can take care itself. You can fork his code present in Github (Url mentioned below), Feel free to do changes if required from devops perspective.

Project to be used :- https://github.com/Abhiknoldur/akka-http-examples.git 

### Acceptance criteria for Madhukaraphatak:- 
1) Figure out the ways to run this project as local and in docker
2) Different Branching strategy should be used. (i.e. Production , testing and Development these three branches will be used and Tests will run in all the three Branches but in Production Branch , test as well as a Docker image will be created ).
3) Deploy that docker image on a remote server over k8 or minikube its your choice(Hint: Use any plugin or script)
4) At the end we need a Clean production ready docker image from the production branch with tag (Hint: tagging will be on the based of git commit hash to the image).
5) Email notification will be generated too saying the status of the job is it successfully completed or not. (Hint: Configure Email Notification plugin)
6) Do follow all the best practice and convention at every steps/stages (i.e. Git, sbt CI-CD, Docker, k8)

## All the best