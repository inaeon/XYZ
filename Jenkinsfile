
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
				script {
					// Checking the previous container functionality
					// if it is running, stop and delete the old container
					// else if it is stopped, just delete it
					// else at last create a new container on the same port
					
					
					sh """
					if [ \$(docker ps -q -f name=xyz_project_5) ]; then
						docker stop xyz_project_5
						docker rm xyz_project_5
						
					elif [ \$(docker ps -aq -f name=xyz_project_5) ]; then
						docker rm xyz_project_5
						
					fi
					docker run -itd -p 8082:8080 --name xyz_project ${IMAGE_NAME}:${BUILD_NUMBER}
					"""			
				}
			}
		}
	
	
	
	}
	

}