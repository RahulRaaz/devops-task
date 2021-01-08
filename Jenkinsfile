pipeline {
    environment {
    registry = "rahulravichandran94/devops-task"
    registryCredential = 'docker-integ_devops'
  }
    agent none
    stages {
        stage('Build') {
            agent { dockerfile true
              }
            steps {
	    	script {
		    docker.build registry + ":$BUILD_NUMBER"
		}
	    }
        }
    }
}
