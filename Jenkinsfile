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

        stage('Build Image') {
            steps {
                script {
                    img = "nandini773/myapp:${env.BUILD_ID}"
                    println("${img}")
                    dockerImage = docker.build("${img}")
                }
            }
        }

 

        stage('Deploy to Test Server') {
            steps {
                script {
                    def stopcontainer = "docker stop ${JOB_NAME}"
                    def delcontName = "docker rm ${JOB_NAME}"
                    def delimages = 'docker image prune -a --force'
                    def drun = "docker run -d --name ${JOB_NAME} -p 5000:5000 ${img}"
                    println "${drun}"

 
                }
            }
        }
    }
}
