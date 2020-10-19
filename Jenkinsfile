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
			post{
				success{
				sh "echo code compiled successfully"
				}
				failure{
					sh "echo code not compiled"
				}
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
					emailext ( 
						subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!!', 
						body: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS:Check console output at $BUILD_URL to view the results. Current build number testing failed.',
						to : 'himanshuchaudhary426@gmail.com'
						)
				}
			}
		}
		stage('packaging')
		{
			when{
				branch 'production'
			}
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
				sh "sudo docker login -u ${USERNAME} -p ${PASSWORD}"  
				sh "sudo /home/knoldus/dockerCapstone/build.sh"
			}
			post{
				success{
					sh "echo Build and push Successful"
					emailext ( 
						subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!!', 
						body: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS:Check console output at $BUILD_URL to view the results. New image build and pushed successfully to dockerhub.',
						to : 'himanshuchaudhary426@gmail.com'
						)
				}
				failure{
					sh "echo Build and push failed"
					emailext ( 
						subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!!', 
						body: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS:Check console output at $BUILD_URL to view the results. Current production build failed.',
						to : 'himanshuchaudhary426@gmail.com'
						)
				}
			}
		}

		stage('deploy to production'){
			when{
				branch 'production'
			}
			steps{

				sh "kubectl apply -f http-akka-example.yml"
				sh "update.sh"
			}
		}

	}
}
