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
                withEnv(["HOME=${env.WORKSPACE}"]) {
                    sh 'pip install --user -r requirements.txt'
                }
	    script {
		    docker.build registry + ":$BUILD_NUMBER"
		}
	    }
        }
    }
}
