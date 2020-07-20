//import com.cwctravel.hudson.plugins.extended_choice_parameter.ExtendedChoiceParameterDefinition
properties
node {

    stage('Checkout') {
        checkout scm
    }

//    def multiSelect = new ExtendedChoiceParameterDefinition("name",
//            "PT_MULTI_SELECT",
//            "blue,green,yellow,blue",
//            "project name",
//            "",
//            "",
//            "",
//            "",
//            "",
//            "",
//            "",
//            "",
//            "",
//            "",
//            "",
//            "",
//            "",
//            "blue,green,yellow,blue",
//            "",
//            "",
//            "",
//            "",
//            "",
//            "",
//            "",
//            "",
//            false,
//            false,
//            3,
//            "multiselect",
//            ",")
//
//    def userInput = input id: 'customID', message: 'Let\'s promote?', ok: 'Release!', parameters: [multiSelect]


//    echo "Hello: " + userInput

//    stage('Test') {
//        def reg = input(
//                message: 'What is the reg value?',
//                parameters: [
//                        [$class     : 'ChoiceParameterDefinition',
//                         choices    : 'Choice 1\nChoice 2\nChoice 3',
//                         name       : 'input',
//                         description: 'A select box option']
//                ])
//
//        echo "Reg is ${reg}"
//    }


//    def deployDate = input(
//            id: 'deploy_date', message: 'Deploy Date',
//            parameters: [
//                    [$class: 'StringParameterDefinition', defaultValue: 'NOT_DEPLOY', description: 'Format: YYMMDD, like 190506(means 2019/05/06)', name: 'deploy_date']
//            ]
//    )

    echo("Deploy date is " + $DEPLOY_DATE)

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