pipeline {
    agent any

    stages {
        stage('checkout Github code') {
            steps{checkout scm}
        }
        stage('Generate CMake files') {
            steps{sh 'cd src && mkdir build && cd build'
                  sh 'cmake ..'}
        }
        stage('Build the code') {
            steps{sh 'make'}
        }
        stage('Notification') {
            steps{echo "Code has been built"}
        }
    }
}
