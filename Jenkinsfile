pipeline {
    agent any

    stages {
        stage ('checkout code'){
            steps{checkout scm}
        }
        stage('Generate CMake files') {
            steps{
                dir('./src') {sh 'mkdir build'}
                dir('./build') {sh 'cmake ..'}
            }
        }
        stage('Build the code') {
            steps{sh 'make'}
        }
        stage('Notification') {
            steps{echo "Code has been built"}
        }
    }
}
