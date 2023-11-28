pipeline {
    agent {
        docker {
            image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Your Docker build and other commands here
                    sh 'docker build -t nandini773/myapp .'
                }
            }
        }
    }
}
