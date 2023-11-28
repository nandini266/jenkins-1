def img
pipeline {
    environment {
        dockerImage = ''
    }
    agent any
    stages {
        stage('checkout') {
            steps {
                git 'https://github.com/nandini-211019/jenkins.git'
            }
        }
    }
}
