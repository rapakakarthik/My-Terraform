pipeline {
    agent any

    stages {
        stage('clone') {
            steps {
                git branch: 'main', url: 'https://github.com/rapakakarthik/My-Terraform.git'
            }
        }
        
        stage('init,apply') {
            steps {
                dir("Terraform-script-Jenkins"){
                sh "terraform init"
                sh "terraform ${action} --auto-approve"
            }
        }
    }
        
    }
}
