
pipeline {
    agent any
    
    stages {
        stage('clone project') { 
            steps {
               git branch: 'main', url: 'https://github.com/sunchula/springboot-junit-mockito.git'
            }
        }
        stage('Compilation') { 
            steps {
               sh 'echo mvn clean install'
            }
        }
        stage('Test') { 
            steps {
                echo 'Testing'
            }
        }
    }
}
