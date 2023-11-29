def img
pipeline {
    environment {
        dockerImage = ''
        registry = 'nandini773/myapp'
        registryCredential = 'dockerhub_id'
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

                sh label: '', script: "docker run -d --name AAaaapp -p 2376:5000 ${img}"
          }
        }

                stage('Push To DockerHub') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
                stage('Deploy to Test Server') {
            steps {
                script {
                    def stopcontainer = "docker stop ${JOB_NAME}"
                    def delcontName = "docker rm ${JOB_NAME}"
                    def delimages = 'docker image prune -a --force'
                    def drun = "docker run -d --name ${JOB_NAME} -p 2376:5000 ${img}"
                    println "${drun}"
                    sshagent(['docker-test']) {
                        sh returnStatus: true, script: "ssh -o StrictHostKeyChecking=no docker@172.17.0.1 ${stopcontainer} "
                        sh returnStatus: true, script: "ssh -o StrictHostKeyChecking=no docker@172.17.0.1 ${delcontName}"
                        sh returnStatus: true, script: "ssh -o StrictHostKeyChecking=no docker@172.17.0.1 ${delimages}"

                    // some block
                        sh "ssh -o StrictHostKeyChecking=no docker@172.17.0.1 ${drun}"
                    }
                }
            }
        }

    }
}
