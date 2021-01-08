pipeline {
    environment {
        registry = "rahulravichandran94/devops-task"
        registryCredential = 'docker-integ_devops'
    }
    agent none 
    stages {
        stage('Build') { 
            agent any
            steps {
		withEnv(["HOME=${env.WORKSPACE}"]) {
		    sh 'pip install --user -r requirements.txt' 
		}
		docker.build registry + ":$BUILD_NUMBER"
            }
	}
    }
}
