pipeline {
    agent any
    stages {
        stage('Build') {
            steps { 
                sh 'docker build --tag hello .'
            }
        }
        stage('Publish') {
            steps { 
                echo 'publishing version ${env.VERSION} ...'
            }
        }
    }
}