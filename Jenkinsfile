pipeline {
    agent any
        stages {
        stage('Git checkout') {
            steps {
                    git 'https://github.com/marusya8004/DiplomProject.git'
            }
        }

        stage('Chrome') {
            steps {
		sh 'mvn clean test "-Dsurefire.suiteXmlFiles=src/test/resources/TestNG.xml" "-Dtestng.dtd.http=true"'
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
