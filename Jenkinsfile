pipeline {

    agent any

    stages {

        stage('Terraform Init') {

            steps {

                sh 'cd terraform && terraform init'
            }
        }

        stage('Terraform Validate') {

            steps {

                sh 'cd terraform && terraform validate'
            }
        }

        stage('Terraform Apply') {

            steps {

                sh 'cd terraform && terraform apply -auto-approve'
            }
        }
    }
}
