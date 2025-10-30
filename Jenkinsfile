pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "seada98/flask-ci-cd"
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-token', variable: 'DOCKERHUB_TOKEN')]) {
                    sh '''
                        echo "$DOCKERHUB_TOKEN" | docker login -u seada98 --password-stdin
                        docker push $DOCKER_IMAGE
                    '''
                }
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent(['ec2-key']) {
                    sh '''
                        ssh -o StrictHostKeyChecking=no ubuntu@<EC2-IP> \
                        "docker pull $DOCKER_IMAGE && docker stop flask-app || true && docker rm flask-app || true && docker run -d -p 80:5000 --name flask-app $DOCKER_IMAGE"
                    '''
                }
            }
        }
    }
}