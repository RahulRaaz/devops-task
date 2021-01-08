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
		    sh 'ls'
		    stash(name: 'all-files', includes: './*')
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
		    unstash(name: 'all-files')
		    sh 'python sources/app.py'
	            }
	        post {
		    success {
		        archiveArtifacts "${env.BUILD_ID}/app"
		    }
	        }
	    }
        }
    }

