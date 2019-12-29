pipeline {
    agent any

    triggers {
        pollSCM('H/5 8-23 * * 1-5')
    }

    stages {
        stage('Checkout') {
            steps {
               checkout scm
            }
        }

        stage('test') {
            steps{
                 sh "./gradlew clean test"
             }
        }

        stage('build package') {
            steps {
                sh "./gradlew clean build"
            }
        }

        stage("build image"){
            steps {
                sh "docker build -t 192.168.99.100:5000/my-app:${env.BUILD_NUMBER} ."
                sh "docker tag 192.168.99.100:5000/my-app:${env.BUILD_NUMBER} 192.168.99.100:5000/my-app:latest"
                sh "docker push 192.168.99.100:5000/my-app:${env.BUILD_NUMBER}"
                sh "docker push 192.168.99.100:5000/my-app:latest"
            }
        }
    }
}