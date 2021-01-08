pipeline {
    agent none
    stages {
        stage('Build') {
	    def app
            agent {
                docker {
                    image 'python:3.6'
                }
            }
            steps {
                withEnv(["HOME=${env.WORKSPACE}"]) {
                    sh 'pip install --user -r requirements.txt' 
                }
		app = docker.build("getintodevops/hellonode")
            }
        }
    }
}
