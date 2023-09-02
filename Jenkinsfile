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
                    def dockerImage = docker.build("nidhinb143/webapp:latest")
                    // Store the Docker image ID for later use
                    dockerImageId = dockerImage.id
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'nidhinb143') {
                        // Use the Docker image ID previously stored
                        docker.image(dockerImageId).push('latest')
                    }
                }
            }
        }

        stage('Deploy to Minikube') {
            steps {
                script {
                    sh 'kubectl apply -f deployment.yaml --kubeconfig=/var/k8s/config'
                    sh "kubectl rollout restart deployment webapp-deployment --kubeconfig=/var/k8s/config"
                    sh 'kubectl apply -f service.yaml --kubeconfig=/var/k8s/config'
                }
            }
        }
    }
}