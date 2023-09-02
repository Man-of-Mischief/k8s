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

                    // def kubeconfigPath = "/home/ec2-user/.kube/config"

                    // sh 'kubectl config set-context minikube --cluster=minikube --user=minikube'
                    // sh 'kubectl config use-context minikube'
                    // sh 'kubectl --kubeconfig=${kubeconfigPath} apply -f deployment.yaml'
                    // sh 'kubectl apply -f service.yaml'

                    sh 'kubectl apply -f deployment.yaml --kubeconfig=/var/k8s/config'
                    // sh 'kubectl apply -f /home/ec2-user/Task/Tasks/service.yaml'
                }
            }
        }
    }
}
