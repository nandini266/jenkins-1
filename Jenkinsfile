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

        stage('Test - Run Docker Container on Jenkins node') {
            steps {
                sh "docker run -d --name ${JOB_NAME} -p 5000:5000 ${img}"
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

                    sshagent(['docker-test']) {
                        sh "ssh -o StrictHostKeyChecking=no docker@192.168.10.234 ${stopcontainer} "
                        sh "ssh -o StrictHostKeyChecking=no docker@192.168.10.234 ${delcontName}"
                        sh "ssh -o StrictHostKeyChecking=no docker@192.168.10.234 ${delimages}"

                        // some block
                        sh "ssh -o StrictHostKeyChecking=no docker@192.168.10.234 ${drun}"
                    }
                }
            }
        }
    }
}
