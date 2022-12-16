pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps{
                sh 'docker build -t cpp-pipeline-example .'
            }
        }
        stage('Notification') {
            steps{echo "Code has been built"}
        }
    }
}
