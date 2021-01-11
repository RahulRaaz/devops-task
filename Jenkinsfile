pipeline {
	agent any
	    stages {
    	    stage('Building image') {
      	 	steps {
           	    script {
          	        dockerImage = docker.build registry + ":$BUILD_NUMBER"
        	}
	    }
	}
	    stage('Deploying image') {
		steps {
		    sh "sudo docker run --rm -m -d -p 5000:5000 $dockerImage"
            }
	}
    }
}
