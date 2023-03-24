pipeline {
    agent any
	environment{
	    def mavenHome =  tool name: "maven-jenkins", type: "maven"
		def mavenCMD = "${mavenHome}/bin/mvn"
	}
    
    stages {
        stage('clone project') { 
            steps {
               git branch: 'main', url: 'https://github.com/sunchula/springboot-junit-mockito.git'
            }
        }
        stage('build') { 
            steps {
               sh "${mavenCMD} clean package"
            }
        }
        stage('Build Docker Image') {
	         steps {
	           script {
				    sh 'docker build -t junitapp:v1 .'
				}
			 }
		 }
		 stage('Push Docker Image') {
	         steps {
	           script {
	           
	           withCredentials([string(credentialsId: 'dockerHub-pwd', variable: 'dockerhubpwd')]) {
				
				sh "docker login -u praveensunchula -p ${dockerhubpwd}"
				
				}
				    sh 'docker tag praveensunchula/junitapp:v1 praveensunchula/junitapp:v1'
					sh 'docker push praveensunchula/junitapp:v1'
				}
			 }
		 }
		 stage('Test') { 
            steps {
                echo 'Testing'
            }
         }
     }  
       post{
		    success{
			        sh 'echo "Thanks you.!! Pipeline successfully executed"'
			        cleanWs()
		 	}
		    failure{
			        sh 'echo "failed, Please resolve the issue"'
					cleanWs()
		    }
		}
}
