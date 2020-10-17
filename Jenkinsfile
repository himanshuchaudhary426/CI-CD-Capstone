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
				sh "echo Testing Started"
				sh "sbt test"
			}
			post{
				success{
					sh "echo Testing successful"
				}
				failure{
					sh "echo Testing failed"
				}
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
			post{
				success{
					sh "echo Build and push Successful"
				}
				failure{
					sh "echo Build and push failed"
				}
			}
		} 

		stage('deploy to production'){
			when{
				branch 'production'
			}
			steps{
				withKubeConfig([credentialsId: 'kube-config',serverUrl: 'https://35.184.199.104', contextName: 'google-cloud-cluster'
                    ]) {
				sh "sudo kubectl apply -f /home/knoldus/dockerCapstone/http-akka-project.yml"
			}
		}

	}
}
}