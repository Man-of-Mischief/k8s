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
                    def customTag = "webapp-${env.BUILD_NUMBER}"
                    def dockerImage = docker.build("nidhinb143/${customTag}")
                    // Store the Docker image ID for later use
                    dockerImageId = dockerImage.id
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    def customTag = "webapp-${env.BUILD_NUMBER}"
                    docker.withRegistry('https://registry.hub.docker.com', 'nidhinb143') {
                        // Use the Docker image ID previously stored with the unique tag
                        docker.image("${dockerImageId}:${customTag}").push()
                    }
                }
            }
        }

        stage('Deploy to Minikube') {
            steps {
                script {
                    sh 'kubectl apply -f deployment.yaml --kubeconfig=/var/k8s/config'
                    sh 'kubectl apply -f service.yaml --kubeconfig=/var/k8s/config'
                }
            }
        }
    }
}
