pipeline {
    agent {
        docker {
            image 'node:latest' 
            args '-v $(pwd)/src:/app/src -v $(pwd)/test:/app/test -p 8080:8080' 
        }
    }
    stages {
        stage('Build') { 
            steps {
                sh 'npm install' 
            }
        }
    }
}
