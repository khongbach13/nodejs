pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Kiểm tra mã nguồn từ repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Xây dựng Docker image
                    docker.build('my-web-app')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Chạy Docker container từ image vừa xây dựng
                    docker.image('my-web-app').run('-p 3000:3000')
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    // Thực hiện kiểm tra (nếu có)
                    // Ví dụ: Kiểm tra ứng dụng web bằng cURL hoặc các công cụ kiểm tra khác
                    sh 'curl -f http://localhost:3000 || exit 1'
                }
            }
        }
    }

    post {
        always {
            // Dừng các container đã chạy (nếu cần)
            sh 'docker stop $(docker ps -q --filter "ancestor=my-web-app") || true'
        }
    }
}
