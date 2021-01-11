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
	    stage('Pushing  image') {
		steps { 
		    script {
		        withAWS(region:'us-east-2',credentials:'Jenkins_aws') {
		            s3Delete(bucket: 'rahul-devops-test-s3', path:'**/*')
              		    s3Upload(bucket: 'rahul-devops-test-s3', workingDir:'build', includePathPattern:'**/*');
		    }
  		}
	    }
	}
    }
}
