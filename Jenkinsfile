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
	    stage('Deploy') {
	        agent any
	        environment {
		    VOLUME = '$(pwd)/'
		    IMAGE = 'python:3.6'
	            }
	        steps {
		    sh 'python app.py'
	            }
	        post {
		    success {
		        archiveArtifacts "${env.BUILD_ID}/app"
		    }
	        }
	    }
        }
    }

