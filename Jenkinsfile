pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "sridzar007/web-app:latest"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/sridhar7601/jenkins-docker-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-hub-password', variable: 'DOCKER_PASSWORD')]) {
                    sh """
                    echo "$DOCKER_PASSWORD" | docker login -u "sridzar007" --password-stdin
                    docker push $DOCKER_IMAGE
                    """
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
