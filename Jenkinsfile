pipeline {  
	environment {
    	    registry = "rahulravichandran94/devops-task"
    	    registryCredential = 'docker-integ_devops'
	    dockerImage = ""
  	} 
	agent any  
	    stages {
    	        stage('Building image') {
      		    steps {
        		script {
          		    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
    	    }
	}
		stage('Push image to Docker hub') {
		    steps {
		    	script {
		            docker.withRegistry( '', registryCredential ) {
		            	dockerImage.push()
		    }
		}
	    }
        }
                stage('Push image to Docker hub') {
                    steps {
                        sh 'docker run --rm -d -p 5000:5000 $registry'
            }
        }
    }
}
