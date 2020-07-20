def repositories = repository.split(',') as String[]
def deployDate = DEPLOY_DATE
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
        echo "deploy date: ${deployDate}"
        sh "./gradlew clean test"
    }

    stage('Done') {
        echo 'Done pipeline'
    }

}