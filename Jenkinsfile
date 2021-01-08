pipeline {  environment {
    registry = "rahulravichandran94/devops-task"
    registryCredential = 'docker-integ_devops'
  }  agent any  stages {
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
  }
}
