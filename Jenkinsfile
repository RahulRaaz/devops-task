pipeline {
    environment {
        registry = "rahulravichandran94/devops-task"
        registryCredential = 'docker-integ_devops'
    }
    agent none 
    stages {
        stage('Build') { 
            agent {
                    image 'python:3.6' 
            }
            steps {
		withEnv(["HOME=${env.WORKSPACE}"]) {
		    sh 'pip install --user -r requirements.txt' 
		}
		docker.build registry + ":$BUILD_NUMBER"
            }
	}
    }
}
