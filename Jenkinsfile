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
                stage('Stop existing docker image if already running'){
                    steps{
			script{
			    stts = nc -z lcoalhost 5000
                            if (stts) {
                                sh "docker stop devops-task"
				sh "echo 'Build Stopped'"
                     }
			    else {
				sh 'echo "No Build running, proceeding to deploy"'
		     }
                }
            }
        }
                stage('Run image in ec2') {
                    steps {
                        sh 'docker run --rm -d -p 5000:5000 devops-task:$BUILD_NUMBER'
            }
        }
    }
}
