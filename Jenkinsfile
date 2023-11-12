pipeline{
  agent any
  tools{
        maven 'Maven3'
    }
    stages{
    stage('Build Maven Project') {
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/dagutierrez-mx/COMP367MavenWebApp']])
                sh 'mvn clean install'
            }
        }
        stage('Docker Build') {
            steps{
                script{
                    sh 'docker build -t dagutiercente/mavenwebapp .'
                }
            }
        }
        stage('Docker Login'){
            steps{
                script{

                    withCredentials([usernamePassword(credentialsId: 'dockerhub_id', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login --username ${USERNAME} --password ${PASSWORD}'
                    }
                }
            }
  		}
  		stage('DockerHub Push'){
            steps{
                script{

                    sh 'docker push dagutiercente/mavenwebapp'
                }
            }
  		}
	}
}