pipeline {
    agent any
        stages {
        stage('Git checkout') {
            steps {
                    git 'https://github.com/marusya8004/DiplomProject.git'
            }
        }

        stage('Run Test') {
            steps {
		bat 'mvn clean test -Dsurefire.suiteXmlFiles=src/test/resources/TestNG.xml'
            }
        }
    }

    post {
        always {
            script {
                allure([
                    includeProperties: false,
                    jdk: '',
                    properties: [],
                    reportBuildPolicy: 'ALWAYS',
                    results: [[path: 'target/allure-results']]
                    ])
            }
        }
    success{
            cleanWs()
        }
    }
}
