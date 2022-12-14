pipeline {
    agent any

    stages {
        stage('Generate CMake files') {
            steps{
                dir('./src') {sh "mkdir build-${BUILD_NUMBER}"
                    dir("./build-${BUILD_NUMBER}") {sh 'cmake ..'}
                }
            }
        }
        stage('Build the code') {
            steps{dir("./src/build-${BUILD_NUMBER}") {sh 'make'}}
        }
        stage('Notification') {
            steps{echo "Code has been built"}
        }
    }
}
