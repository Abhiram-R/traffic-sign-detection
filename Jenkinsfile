pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps{
                sh "docker build -t abhiramreghu/cpp-pipeline-example:${env.BUILD_NUMBER} ."
            }
        }
        stage('Push to Docker Hub') {
            steps{
                withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
                    sh "docker login -u abhiramreghu -p ${dockerhubpwd}"
                }
                sh "docker push abhiramreghu/cpp-pipeline-example:${env.BUILD_NUMBER}"
            }
        }
        stage('Notification') {
            steps{echo "Code has been built"}
        }
    }
}
