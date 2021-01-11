pipeline {  
	environment {
    		registry = "rahulravichandran94/devops-task"
    		registryCredential = 'docker-integ_devops'
		dockerImage = ""
  	}  
	agent any  
		stages {
    		stage('Building image') {
      			steps{
        			script {
          				dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
		stage('Pushing image') {
			steps {
				script {
			            docker.withRegistry( '', registryCredential ) {
			            dockerImage.push()
			}
		}
		}
	}

  }
}
