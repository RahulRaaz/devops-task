pipeline {  
	environment {
    	    registryCredential = 'docker-integ_devops'
	    dockerImage = ""
  	} 
	agent any  
	    stages {
    	        stage('Verify if image is stable') {
      		    steps {
        		script {
          		    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
    	    }
	}
                stage('Run image in ec2') {
                    steps {
			sh 'docker build -t devops-task .'
                        sh 'docker run --rm -d -p 5000:5000 devops-task'
            }
        }
    }
}
