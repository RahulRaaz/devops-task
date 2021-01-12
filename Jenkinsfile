pipeline {  
	environment {
    	    registryCredential = 'docker-integ_devops'
	    dockerImage = ""
  	} 
	agent any  
	    stages {
    	        stage('Build image') {
      		    steps {
          		    sh "docker build -t devops-task:$BUILD_NUMBER ."
                }
    	    }
                stage('Run image in ec2') {
                    steps {
                        sh 'docker run --rm -d -p 5000:5000 devops-task:$BUILD_NUMBER'
            }
        }
    }
}
