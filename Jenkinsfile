pipeline {
    agent any

    triggers {
        pollSCM('H/5 8-23 * * 1-5')
    }

    environment {
        DEPLOY_DATE = ''
    }


    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

//        DEPLOY_DATE = $deployDate
//        echo $DEPLOY_DATE
//        IFS = ","
//        def deployRepositories = $repositories

        stage('test') {
            steps {
                echo "Will deploy to ${$DEPLOY_DATE}"
                sh "./gradlew clean test"
            }
        }

        stage('Done') {
            steps {
                echo 'Done pipeline'
            }
        }

//        stage('build package') {
//            steps {
//                sh "./gradlew clean build"
//            }
//        }
//
//        stage("build image"){
//            steps {
//                sh "docker build -t 192.168.99.100:5000/my-app:${env.BUILD_NUMBER} ."
//                sh "docker tag 192.168.99.100:5000/my-app:${env.BUILD_NUMBER} 192.168.99.100:5000/my-app:latest"
//                sh "docker push 192.168.99.100:5000/my-app:${env.BUILD_NUMBER}"
//                sh "docker push 192.168.99.100:5000/my-app:latest"
//            }
//        }
    }
}