pipeline {
    agent none
    stages {
        stage('Build') {
            agent { dockerfile true
              }
            steps {
                withEnv(["HOME=${env.WORKSPACE}"]) {
                    sh 'pip install --user -r requirements.txt'
                }
	    }
        }
    }
}
