env.buildPath = '~/home/.jenkins/workspace/cpp-pipeline/src/build'
node('') {
        stage ('checkout code'){
            checkout scm
        }
        stage('Generate CMake files') {
            sh 'cd src && mkdir build && cd build'
            sh 'cd ${env.buildPath} && cmake ..'
        }
        stage('Build the code') {
            sh 'cd ${env.buildPath} && make'
        }
        stage('Notification') {
            echo "Code has been built"
        }
}
