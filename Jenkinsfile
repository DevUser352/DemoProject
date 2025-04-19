pipeline {
    agent any

    environment {
        DOCKER_REPO = "devuser352/java-coding-practice"
        DOCKER_IMAGE = "${DOCKER_REPO}:latest"
    }

    stages {
        stage('Build Jar') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DockerHub-Credentials', usernameVariable: 'DOCKER_HUB_USR', passwordVariable: 'DOCKER_HUB_PSW')]) {
                    bat "docker login -u %DOCKER_HUB_USR% -p %DOCKER_HUB_PSW%"
                    bat "docker push ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning up Docker login"
            bat "docker logout"
        }
        success {
            echo "Pipeline completed successfully!"
        }
        failure {
            echo "Pipeline failed. Please check the console output."
        }
    }
}
