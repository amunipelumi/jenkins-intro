pipeline {
    agent { 
        node {
            label 'docker-agent'
        }
    }
    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('Build') {
            steps {
                echo "Stage 1"
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                cd myapp
                pip install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Stage 2"
                sh '''
                . venv/bin/activate
                cd myapp
                python hello.py
                python hello.py --name=Amuni
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo "Stage 3"
                sh '''
                python3 helloworld.py
                echo "Ran all stages successfully.."
                '''
            }
        }
    }
}
