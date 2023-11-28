def img
pipeline {
    environment {
        dockerImage = ''
    }
    agent any
    stages {
        stage('git checkout') {
            steps {
                git branch: 'main' , url: 'https://github.com/nandini-211019/jenkins.git'
            }
        }
        stage('build') {
            steps {
                script {
                    img = 'nandini773/myapp'
                    println({img})
                    dockerImage = docker.build({img})
                }
            }
        }
    }
}
