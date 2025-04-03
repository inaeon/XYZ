
pipeline {
	agent any 
	environment {
		IMAGE_NAME = "avdeshsainger/xyztechnologies"
	}
	
	
	stages {
		stage('code checkout') {
			steps {
				git branch: 'main', url: 'https://github.com/inaeon/XYZ.git'
			}
		}
		stage('code compile') {
			steps {
				sh 'mvn clean compile'
			}
		}
		stage('code test') {
			steps {
				sh 'mvn test'
			}
		}
		stage('code package'){
			steps {
				sh 'mvn package'
			}
		}
		stage('build docker image') {
			steps {
				sh 'cp target/XYZtechnologies-1.0.war .'
				sh "docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} ."
			}
		}
		stage('push docker image') {
			steps {
				withDockerRegistry([credentialsId: "hub.docker.com", url: ""]) {
					sh "docker push ${IMAGE_NAME}:${BUILD_NUMBER}"
				}
			}
		}
		stage('deployment') {
			steps {
				sh "docker run -itd -p 8081:8080 --name xyz_project_${BUILD_NUMBER} ${IMAGE_NAME}:${BUILD_NUMBER}"
			}
		}
	
	
	
	}
	

}