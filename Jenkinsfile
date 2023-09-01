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
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, passwordVariable: 'DOCKER_PASSWORD')]) {
                        def dockerImage = docker.build(DOCKER_IMAGE_NAME, '.')
                        docker.withRegistry('', 'docker') {
                            dockerImage.push()
                        }
                    }
                }
            }
        }
    }
}
