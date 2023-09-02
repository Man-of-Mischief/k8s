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
                    def sourceImage = "nidhinb143/${customTag}"
                    def targetImage = "nidhinb143/webapp:${customTag}"
                    
                    // Tag the image correctly
                    docker.tag(sourceImage, targetImage)
                    
                    // Store the Docker image ID for later use
                    dockerImageId = dockerImage.id
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    def customTag = "webapp-${env.BUILD_NUMBER}"
                    def targetImage = "nidhinb143/webapp:${customTag}"
                    
                    docker.withRegistry('https://registry.hub.docker.com', 'nidhinb143') {
                        // Use the tagged Docker image for pushing
                        docker.image(targetImage).push()
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
