pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Check Docker Image Existence') {
            steps {
                script {
                    def frontendImage = "musketeers32111/ca4:web"
                    def backendImage = "musketeers32111/mydb-postgres:latest"
                    
                    def frontendExists = sh(script: "docker images -q ${frontendImage}", returnStatus: true) == 0
                    def backendExists = sh(script: "docker images -q ${backendImage}", returnStatus: true) == 0
                    
                    if (!frontendExists || !backendExists) {
                        error("Frontend or backend Docker images do not exist on Docker Hub. Please make sure they are available.")
                    }
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                sh 'docker-compose -f docker-compose.yml up -d'
            }
        }
    }
}
