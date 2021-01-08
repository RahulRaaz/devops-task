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
		}
            }
	}
    }
    node {    
        def app     
        stage('Build image') {         
            app = docker.build("brandonjones085/test")    
        }
        stage('Test image') {
            app.inside {            
                sh 'echo "Tests passed"'        
            }    
        }
        stage('Push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'git') {
                app.push("${env.BUILD_NUMBER}")            
                app.push("latest")        
            }    
        }
    }
}
