pipeline {
    agent any

    stages {
        stage('checkout Github code') {
            checkout scm
        }
        stage('Generate CMake files') {
            sh 'mkdir build && cd build'
            sh 'cmake ..'
        }
        stage('Build the code') {
            sh 'make'
        }
        stage('Notification') {
            echo "Code has been built"
        }
    }
}
