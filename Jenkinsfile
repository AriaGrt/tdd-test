pipeline {
	stages{
		stage('Checkout'){
			checkout scm
		}
		stage('Environment') {
			sh 'git --version'
			echo "Branch: ${env.BRANCH_NAME}"
			sh 'docker -v'
			sh 'printenv'
		}
		stage('Build Image'){
			sh 'docker build -t tdd-test .'
		}
		stage('Run Image'){
			sh 'docker run -p 8080:8080 tdd-test'
		}
		stage('Clear Docker'){
			sh 'docker rmi tdd-test'
		}
		stage('Deploy'){
			sh 'docker build -t tdd-test --no-cache .'
			sh 'docker tag tdd-test localhost:8080/tdd-test'
			sh 'docker push localhost:8080/tdd-test'
			sh 'docker rmi -f tdd-test localhost:8080/tdd-test'	
		}
	}
}
