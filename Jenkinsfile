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
                sh "docker build -t twchenjia/repo.mine:${env.BUILD_NUMBER} ."
                sh "docker tag twchenjia/repo.mine:${env.BUILD_NUMBER} twchenjia/repo.mine:latest"
                sh "docker push twchenjia/repo.mine:${env.BUILD_NUMBER}"
                sh "docker push twchenjia/repo.mine:latest"
            }
        }
    }
}