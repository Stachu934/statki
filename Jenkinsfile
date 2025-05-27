pipeline {
    agent {
        docker {
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    environment {
        IMAGE_NAME = 'statki-builder'
        DOCKERFILE = 'Dockerfile.builder'
    }

    stages {
        stage('Start Trigger') {
            steps {
                echo "Rozpoczęcie pipeline – Build #${env.BUILD_NUMBER}"
            }
        }

        stage('Clone') {
            steps {
                git(
                    url: 'https://github.com/Stachu934/statki.git',
                    branch: 'master',
                    credentialsId: 'github-statki-token'  
                )
            }
        }

        stage('Build Docker image') {
            steps {
                sh 'docker build -f $DOCKERFILE -t $IMAGE_NAME .'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'docker run --rm $IMAGE_NAME'
            }
        }

        stage('Archive Logs') {
            steps {
                script {
                    sh 'mkdir -p logs && echo "Przykładowy log" > logs/test.log'
                    archiveArtifacts artifacts: 'logs/*.log', fingerprint: true
                }
            }
        }
    }
}
