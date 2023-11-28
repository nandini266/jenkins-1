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
                    println("${img}")  // 
                    dockerImage = docker.build(img)  //  
                }
            }
        }
                stage('Test - Run Docker Container on Jenkins node') {
           steps {

                sh label: '', script: "docker run -d --name mYAPP -p 5190:5000 ${img}"
          }
        }

                stage('Push To DockerHub') {
            steps {
                script {
                    dockerwithRegistry('https://hub.docker.com', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }

    }
}
