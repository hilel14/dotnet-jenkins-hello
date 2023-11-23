pipeline {
    agent any
    stages {
        stage('Build') {
            steps { 
                sh 'docker build --tag hilel14/hello-dotnet .'
            }
        }
        stage('Push') {
            steps { 
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh 'docker push hilel14/hello-dotnet:latest'
                }
            }
        }
        stage('Deploy') {
            steps { 
                sh 'kubectl apply -f hello.yaml'
            }
        }
    }
}