pipeline {
    environment {
    registry = "rahulravichandran94/devops-task"
    registryCredential = 'docker-integ_devops'
    dockerImage = ""
  }
    agent none
    stages {
        stage('Build') {
            agent { dockerfile true
              }
            steps {
	    	script {
		    dockerImage = docker.build registry + ":$BUILD_NUMBER"
		}
	    }
        }
    }
}
