def repositories = repository.split(',') as String[]
node {
    stage('Checkout') {
        checkout scm
    }

    for (int i = 0; i < repositories.length; i++) {
        stage("Repository ${repositories[i]}") {
            echo "${repositories[i]}"
        }
    }


    stage('test') {
        echo "${repository}"
        echo "Will deploy to ${DEPLOY_DATE}"
        sh "./gradlew clean test"
    }

    stage('Done') {
        echo 'Done pipeline'
    }

}