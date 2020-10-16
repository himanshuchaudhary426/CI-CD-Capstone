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

		stage('package'){
			when{
				branch 'production'
			}
			steps{
				sh "pwd"                                                                                    
			}
		}
	}
}