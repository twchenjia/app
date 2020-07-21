def repositories = repository.split(',') as String[]
def deployDate = DEPLOY_DATE
def map = ["ci-cd-test": "ci-cd-test"]

node {
    stage('Checkout') {
        checkout scm
    }

    for (int i = 0; i < repositories.length; i++) {
        def deployService = repositories[i]
        stage("Deploy Service: ${deployService}") {
            build job: map[deployService], parameters: [
                    string(name: 'DEPLOY_DATE', value: "${DEPLOY_DATE}"),
                    string(name: 'repository', value: "${deployService}")
            ]
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