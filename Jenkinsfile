pipeline {
	agent any
	stages{
		stage('Checkout'){
			steps{
				checkout scm
			}
		}
		stage('Environment') {
			steps{
				sh 'git --version'
				echo "Branch: ${env.BRANCH_NAME}"
				sh 'docker -v'
				sh 'printenv'
			}	
		}
		stage('Build Image'){
			steps{
				sh 'docker build -t tdd-test .'
			}
		}
		stage('Run Image'){
			steps{
				sh 'docker run -p 3000:8080 tdd-test'
			}
		}
		stage('Clear Docker'){
			steps{	
				sh 'docker rmi tdd-test'
			}
		}
		stage('Deploy'){
			steps{
				sh 'docker build -t tdd-test --no-cache .'
				sh 'docker tag tdd-test localhost:8080/tdd-test'
				sh 'docker push localhost:8080/tdd-test'
				sh 'docker rmi -f tdd-test localhost:8080/tdd-test'	
			}
		}
	}
}
