pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                // Use a valid tag format, e.g., 'v1', '1.0', or use a dynamic value
                def dockerTag = 'v1'
                script {
                    dockerImage = docker.build("nidhinb143/webapp:${dockerTag}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Use the same valid tag format here
                    def dockerTag = 'v1'
                    docker.withRegistry('https://registry.hub.docker.com', 'nidhinb143') {
                        dockerImage.push("${dockerTag}")
                    }
                }
            }
        }
    }
}
