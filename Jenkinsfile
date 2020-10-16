pipeline{
	agent any
	environment{
		USERNAME=credentials('USERNAME')
		PASSWORD=credentials('PASSWORD')
	}
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

		stage('build-image'){
			when{
				branch 'production'
			}
			steps{
				sh "sudo cp -r /var/lib/jenkins/workspace/capstone-project_production/* /home/knoldus/dockerCapstone/" 
				sh "sudo docker login -u ${USERNAME} -p ${PASSWORD}"  
				sh "sudo /home/knoldus/dockerCapstone/build.sh"
			}
		} 

		stage('deploy'){
			when{
				branch 'production'
			}
			steps{
				sh "sudo kubectl apply -f /home/knoldus/dockerCapstone/http-akka-project.yml"
			}
		}

	}
}