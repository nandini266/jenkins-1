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

                sh label: '', script: "docker run -d --name AAaaaaaapppi -p 4678:5000 ${img}"
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
                    def drun = "docker run -d --name ${JOB_NAME} -p 4658:5000 ${img}"
                    println "${drun}"
                    sshagent(['docker-test']) {
                        sh returnStatus: true, script: "ssh -o StrictHostKeyChecking=no docker@localhost ${stopcontainer} "
                        sh returnStatus: true, script: "ssh -o StrictHostKeyChecking=no docker@localhost ${delcontName}"
                        sh returnStatus: true, script: "ssh -o StrictHostKeyChecking=no docker@localhost ${delimages}"

                    // some block
                        sh "ssh -o StrictHostKeyChecking=no docker@localhost ${drun}"
                    }
                }
            }
        }

    }
}
