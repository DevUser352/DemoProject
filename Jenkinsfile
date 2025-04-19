pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "java-coding-practice"
        DOCKER_HUB = credentials('DockerHub-Credentials') // Jenkins credentials ID
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
                bat "docker login -u ${DOCKER_HUB_USR} -p ${DOCKER_HUB_PSW}"
                bat "docker push ${DOCKER_IMAGE}"
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
