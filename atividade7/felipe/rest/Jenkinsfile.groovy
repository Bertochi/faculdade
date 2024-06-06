pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Etapa de construção do projeto
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                // Etapa de execução de testes
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                // Etapa de implantação do projeto
                sh 'mvn deploy'
            }
        }
    }
}