pipeline {
	agent {dockerfile true}
	    stages {
    	    stage('Building image') {
      	 	steps {
           	    script {
          	        dockerImage = docker.build registry + ":$BUILD_NUMBER"
        	}
	    stage('Deploying image') {
		steps {
		    script {
			sh "docker run --rm -m -d -p 5000:5000 $dockerImage "
		    }
		}
            }
	}
    }
}
