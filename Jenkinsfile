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
		stage('packaging')
		{
			steps{
				sh "echo packaging the jar"
				sh "sbt assembly"
			}
			post
			{
				success{
					sh "echo packaging successfull"
				}
				failure{
					sh "echo packaging failed"
				}
			}
		}

		stage('build-image'){
			when{
				branch 'production'
			}
			steps{
				sh "sudo cp -r /var/lib/jenkins/workspace/capstone-project_production/target/scala-2.11/akka-http-helloworld-assembly-1.0.jar /home/knoldus/dockerCapstone/jarfiles" 
				sh "sudo cp /home/knoldus/dockerCapstone/jarfiles/akka-http-helloworld-assembly-1.0.jar /home/knoldus/dockerCapstone/oldjars"
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
		post{
			always{
				emailext
			}
		} 

		stage('deploy to production'){
			when{
				branch 'production'
			}
			steps{
				sh "echo in developing"
			}
		}

	}
}
