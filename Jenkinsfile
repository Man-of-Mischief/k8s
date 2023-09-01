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
        
        stage('Copy Kubernetes Config') {
            steps {
                sh 'cp ~/.kube/config /var/lib/jenkins/.kube/config'
            }
        }

        stage('Deploy to Minikube') {
            steps {
                script {
                    sh 'kubectl config use-context minikube'
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }
}
