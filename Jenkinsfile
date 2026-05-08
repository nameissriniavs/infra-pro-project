pipeline {

    agent any

    stages {

        stage('Terraform Init') {

            steps {

                sh '''
                export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY
                export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_KEY
                export AWS_DEFAULT_REGION=us-east-1

                cd terraform
                terraform init
                '''
            }
        }

        stage('Terraform Validate') {

            steps {

                sh '''
                export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY
                export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_KEY
                export AWS_DEFAULT_REGION=us-east-1

                cd terraform
                terraform validate
                '''
            }
        }

        stage('Terraform Apply') {

            steps {

                sh '''
                export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY
                export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_KEY
                export AWS_DEFAULT_REGION=us-east-1

                cd terraform
                terraform apply -auto-approve
                '''
            }
        }
    }
}
