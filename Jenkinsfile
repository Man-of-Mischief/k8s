pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('nidhinb143')
        DOCKER_IMAGE_NAME = 'nidhinb143/webapp:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build(DOCKER_IMAGE_NAME, '.')
                    dockerImage.withRegistry([credentialsId: DOCKER_CREDENTIALS, url: 'docker']) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
