pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-webapp'
        SONAR_URL = 'http://sonarqube:9000'
    }

    stages {
        stage('Clone Code') {
            steps {
                git 'https://github.com/mshood8701/gweb.git'  
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('MySonarQube') {
                    sh 'sonar-scanner'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t  .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker stop webapp || true && docker rm webapp || true'
                sh 'docker run -d --name webapp --network devops-net -p 5000:81 '
                // Map the container's port 80 to host's 5000
            }
        }
    }
}

