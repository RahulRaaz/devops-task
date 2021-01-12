pipeline {  
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
			    def stts = sh(
				    script: "docker ps | grep devops-task | awk '{print \$1}'",
				    returnStdout: true
				)
			    sh "echo ${stts}"
                            if ("$stts") {
                                sh "docker stop $stts"
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
