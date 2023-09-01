pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "" // Define a global environment variable for the Docker image
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
                    DOCKER_IMAGE = "nidhinb143/webapp:latest" // Set the Docker image as an environment variable
                    docker.build(DOCKER_IMAGE)
                }
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
