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
				sh "sudo cp -r /var/lib/jenkins/workspace/capstone-project_production/* /home/knoldus/dockerCapstone/"   
				sh "sudo cd /home/knoldus/dockerCapstone"
				sh "sudo docker build -t himanshuchaudhary/http-akka-example:v1 ."
				sh "sudo docker push himanshuchaudhary/http-akka-example:v1"
			}
		}
	}
}