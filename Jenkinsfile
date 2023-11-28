def img
pipeline {
    environment {
        dockerImage = 'dckr_pat__jUehk6ANCicQpkLct8bLnjJpk8'
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
                    println("${img}")  // Use double quotes for string interpolation
                    dockerImage = docker.build(img)  // Remove curly braces around 'img'
                }
            }
        }
                stage('Test - Run Docker Container on Jenkins node') {
           steps {

                sh label: '', script: "docker run -d --name MyAPP -p 5080:5000 ${img}"
          }
        }

                stage('Push To DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/repository/docker/nandini773/myapp', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }

    }
}
