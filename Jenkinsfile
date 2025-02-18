pipeline {
    agent any

    environment {
        IMAGE_NAME = "sridzar1234@gmail.com/jenkins-docker-app"
        DOCKER_CREDENTIALS = "docker-hub-credentials"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/your-repo/jenkins-docker-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }
    }
}
