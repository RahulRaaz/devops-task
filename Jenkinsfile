node {
    def app
    agent none
    stages {
    stage('Build image') {
	agent {
	    docker {
		image 'python:3.6'
	   }
	} 
        /* This builds the actual image; synonymous to
         * docker build on the command line */
	steps {
                withEnv(["HOME=${env.WORKSPACE}"]) {
                    sh 'pip install --user -r requirements.txt'
                }
		}
		app = docker.build ('rahulravichandran94/devops-task')

    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-integ_devops') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
}
