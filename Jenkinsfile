node {

    properties(
            [parameters([string(defaultValue: 'Master', name: 'BRANCH'),
                         string(defaultValue: '200727', name: 'DEPLOY_DATE')])]
    )

    stage('Checkout') {
        checkout scm
    }

    def coreImageTags = input(
            id: 'coreImageTags', message: 'Enter a comma separated list of additional tags for the image (0.0.1,some-tagname,etc):?',
            parameters: [
                    [$class: 'StringParameterDefinition', defaultValue: 'None', description: 'List of tags', name: 'coreImageTagsList'],
            ]
    )

    echo("Image tags: " + coreImageTags)

//    def deployDate = ${ DEPLOY_DATE }
//    def repository = $ {}
    def tests = ["aa", "bb"] as String[]
    for (int i = 0; i < tests.length; i++) {
        stage("Test ${tests[i]}") {
            echo "tt"
        }
    }


//        DEPLOY_DATE = $deployDate
//        echo $DEPLOY_DATE
//        IFS = ","
//        def deployRepositories = $repositories

    stage('test') {
        echo "Will deploy to ${DEPLOY_DATE}"
        sh "./gradlew clean test"
    }

    stage('Done') {
        echo 'Done pipeline'
    }

}