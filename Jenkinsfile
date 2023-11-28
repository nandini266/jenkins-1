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
                    println("${img}")  // 
                    dockerImage = docker.build(img)  //  
                }
            }
        }
                stage('Test - Run Docker Container on Jenkins node') {
           steps {

                sh label: '', script: "docker run -d --name mmYAPppp -p 5979:5000 ${img}"
          }
        }

                stage('Push To DockerHub') {
            steps {
                script {
                    docker.withRegistry(url : 'https://hub.docker.com/repository/docker/nandini773/myapp', registryCredential : 'dockerhub' ) {
                        dockerImage.push()
                    }
                }
            }
        }

    }
}
