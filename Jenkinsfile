pipeline {
    agent any

    stages {
        stage('Generate CMake files') {
            steps{
                dir('./src') {sh 'mkdir build'
                    dir('./build') {sh 'cmake ..'}
                }
            }
        }
        stage('Build the code') {
            steps{dir('./src/build') {sh 'make'}}
        }
        stage('Notification') {
            steps{echo "Code has been built"}
        }
    }
}
