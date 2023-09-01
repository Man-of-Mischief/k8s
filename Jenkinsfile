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
                script {
                    def dockerImage // Declare dockerImage variable at the global scope
                    dockerImage = docker.build("nidhinb143/webapp:latest")
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
