pipeline {
    agent none 
    stages {
	def app
        stage('Build') { 
            agent {
                docker {
                    image 'python:3.6' 
                }
            }
            steps {
		withEnv(["HOME=${env.WORKSPACE}"]) {
		    sh 'pip install --user -r requirements.txt' 
		    app = docker.build('rahulravichandran94/devops-task')
		}
            }
	}
        stage('PushImage') {
		steps {
		docker.withRegistry('https://registry.hub.docker.com', 'git') {
		    app.push("${env.BUILD_NUMBER}")
		    app.push("latest")
		}
	    }
	}
    }
}
