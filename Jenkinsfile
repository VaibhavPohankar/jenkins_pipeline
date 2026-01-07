pipeline {
    agent any

    tools {
        maven 'Maven'
        // jdk 'JDK11'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t vaibhav/my-app:latest .'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                docker rm -f my-app || true
                docker run -d --name my-app vaibhav/my-app:latest
                '''
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Post-Build') {
            steps {
                sh 'ls -l target'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'target/**/*.jar', allowEmptyArchive: true
            sh 'docker image prune -f'
        }
        success {
            echo 'Build succeeded'
        }
        failure {
            echo 'Build failed'
        }
    }
}
