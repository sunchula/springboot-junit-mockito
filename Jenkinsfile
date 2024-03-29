pipeline {
    agent any
	environment{
	    def mavenHome =  tool name: "maven-jenkins", type: "maven"
		def mavenCMD = "${mavenHome}/bin/mvn"
	}
    
    stages {
        stage('clone project') { 
            steps {
               echo '*******************************code checkout********************************************'
               git branch: 'main', url: 'https://github.com/sunchula/springboot-junit-mockito.git'
            }
        }
        stage('build') { 
            steps {
               echo '***********************************building the code********************************************'
               sh "${mavenCMD} clean package"
            }
        }
        stage('Build Docker Image') {
	         steps {
	           script {
	                echo '***********************************Creating Docker Images********************************************'
				    sh 'docker build -t praveensunchula/junitapp:v1 .'
				}
			 }
		 }
		 stage('Push Docker Image') {
	         steps {
	           script {
	            echo '***********************************Pushing Docker Images to HUB********************************************'
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
			        echo '***********************************success********************************************'
			       	echo '***********************************Clean up jenkins workspace********************************************'
			        cleanWs()
			        echo '**********************************Clean up Docker Images********************************************'
			        sh 'docker system prune -af --volumes'
		 	}
		    failure{
			        echo '***********************************failure********************************************'
			        echo '***********************************Clean up jenkins workspace********************************************'
					cleanWs()
					echo '***********************************Clean up Docker Images********************************************'
					sh 'docker system prune -af --volumes'
		    }
		}
}
