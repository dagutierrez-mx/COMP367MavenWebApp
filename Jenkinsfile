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

                    withCredentials([usernamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login --username ${USERNAME} --password ${PASSWORD}'
                    }

                    sh 'docker push dagutiercente/mavenwebapp'
                }
            }
  		}
	}
}