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
				echo "Testing Started"
				sh "sbt test"
			}
			post{
				success{
					echo "Testing successful"
				}
				failure{
					echo "Testing failed"
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
					echo "Build and push Successful"
				}
				failure{
					echo "Build and push failed"
				}
			}
		} 

		stage('deploy to production'){
			when{
				branch 'production'
			}
			steps{
				withKubeConfig([credentialsId: 'kube-config',serverUrl: 'https://172.17.0.3:8443'
                    ]) {
				sh "sudo kubectl apply -f /home/knoldus/dockerCapstone/http-akka-project.yml"
			}
		}

	}
}