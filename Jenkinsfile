pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Check out code từ Git repository
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Xây dựng Docker image
                    docker.build('my-node-app')
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    // Chạy Docker container từ image đã xây dựng
                    docker.image('my-node-app').run('-p 3002:3000')
                }
            }
        }
    }
    
    post {
        always {
            // Dừng container sau khi build
            script {
                def containerId = sh(script: "docker ps -q -f 'ancestor=my-node-app'", returnStdout: true).trim()
                if (containerId) {
                    sh "docker stop ${containerId}"
                }
            }
        }
    }
}

