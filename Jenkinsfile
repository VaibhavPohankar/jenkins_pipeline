pipeline {
    agent any
    
    tools {
        // Replace with your Jenkins Global Tool name for Maven
        maven 'Maven'
        // Optionally specify JDK if not default
        // jdk 'JDK11'
    }

    stages {
        stage('Checkout') {
            steps {
                // Jenkins automatically does checkout scm in declarative,
                // but this explicit step works too
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                // Maven build: clean package (include tests if needed)
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Post-Build') {
            steps {
                // Optional: list target folder
                sh 'ls -l target'
            }
        }
    }

    post {
        always {
            // Always archive build results
            archiveArtifacts artifacts: 'target/**/*.jar', allowEmptyArchive: true
        }
        success {
            echo 'Build succeeded'
        }
        failure {
            echo 'Build failed'
        }
    }
}
