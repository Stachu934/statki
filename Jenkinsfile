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
        stage('Clone') {
            steps {
                git url: 'https://github.com/TWOJ_USER/statki.git', branch: 'main'
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
                    // Załóżmy, że testy wypisują logi do pliku
                    sh 'mkdir -p logs && echo "Przykładowy log" > logs/test.log'
                    archiveArtifacts artifacts: 'logs/*.log', fingerprint: true
                }
            }
        }
    }
}
