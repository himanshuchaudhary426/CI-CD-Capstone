pipeline{
	agent any
	stages{
		stage('Compile'){
			steps{
				sh "sbt clean compile"
			}
		}

		stage('Test'){
			steps{
				sh "sbt test"
			}
		}

		stage('deploy'){
			when{
				branch 'production'
			}
			steps{
				sh "cp -r /var/lib/jenkins/workspace/capstone-project_production/* /home/knoldus/dockerCapstone/"   
				sh "cd /home/knoldus/dockerCapstone"
				sh "docker build -t himanshuchaudhary/http-akka-example:v1 ."
				sh "docker push himanshuchaudhary/http-akka-example:v1"
			}
		}
	}
}