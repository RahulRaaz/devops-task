pipeline {
    agent none 
    stages {
        stage('Build') { 
            agent {
                docker {
                    image 'python:3.6' 
                }
            }
            steps {
		withEnv(["HOME=${env.WORKSPACE}"]) {
		    sh 'pip install --user -r requirements.txt' 
		}
            }
	}
        def app     
        stage('Build image') {         
            app = docker.build("rahulravichandran94/devops-task")    
        }
        stage('Push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-integ_devops') {
                app.push("${env.BUILD_NUMBER}")            
                app.push("latest")        
            }    
        }
    }
}
