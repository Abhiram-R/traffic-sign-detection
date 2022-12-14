env.buildPath = '/home/.jenkins/workspace/cpp-pipeline/src/build'
pipeline {
    agent any
    stages {
        stage('Generate CMake files') {
            steps{sh 'cd src && mkdir build && cd build'
                  sh 'cd ${env.buildPath} && cmake ..'}
        }
        stage('Build the code') {
            steps{sh 'cd ${env.buildPath} && make'}
        }
        stage('Notification') {
            steps{echo "Code has been built"}
        }
    }
}
