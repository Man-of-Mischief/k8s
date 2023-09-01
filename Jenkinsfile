pipeline {
  agent {
    docker {
      image 'jenkins/jenkins:latest'
    }
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t nidhinb143/webapp:latest .'
      }
    }

    stage('Push Docker Image') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', 'nidhinb143') {
            dockerImage.push('latest')
          }
        }
      }
    }
  }
}
