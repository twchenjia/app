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
            steps {
                lock('test') {
                    script {
                        def err = null
                        try {
                            sh "./gradlew clean test"
                        } catch(caughtError) {
                            err = caughtError
                        }
                    }
                }
                lock('test-coverage') {
                    jacoco(
                          execPattern: 'build/jacoco/jacocoTest.exec',
                          classPattern: 'build/classes/java/main',
                          sourcePattern: 'src/main/java',
                    )
                }
            }
        }

        stage('build package') {
            steps {
                sh "./gradlew clean build"
            }
        }

        stage("build image"){
            steps {
                sh "docker build -t test-app:${env.BUILD_NUMBER} ."
                sh "docker tag test-app:${env.BUILD_NUMBER} test-app:latest"
                docker login http://localhost:5000
                sh "docker push http://localhost:5000/test-app:${env.BUILD_NUMBER}"
                sh "docker push http://localhost:5000/test-app:latest"
            }
        }
    }
}