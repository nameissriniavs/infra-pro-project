pipeline {

    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    stages {

        stage('Terraform Init') {

            steps {

                sh '''
                cd terraform
                terraform init
                '''
            }
        }

        stage('Terraform Validate') {

            steps {

                sh '''
                cd terraform
                terraform validate
                '''
            }
        }

        stage('Terraform Apply') {

            steps {

                sh '''
                cd terraform
                terraform apply -auto-approve
                '''
            }
        }
    }
}