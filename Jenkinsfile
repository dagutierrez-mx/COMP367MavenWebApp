pipeline{
  agent any
  tools{
        maven 'Maven3'
    }
    stages{
    stage('Build Maven') {
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/dagutierrez-mx/COMP367MavenWebApp']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image') {
            steps{
                script{
                    sh 'docker build -t mavenwebapp .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{

                    withCredentials([usenamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'dockerhub_idUsername', passwordVariable: 'dockerhub_idPassword')]) {
                    sh 'docker login --username ${dockerhub_idUsername} --password ${dockerhub_idPassword}'
                    }

                    sh 'docker push mavenwebapp'
                }
            }
  		}
	}
}