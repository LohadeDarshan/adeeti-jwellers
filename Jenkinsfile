pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/LohadeDarshan/adeeti-jwellers.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t adeeti-jwellers .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh '''
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $myserverd --password-stdin
                    docker push adeeti-jwellers
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                    docker stop adeeti-container || true
                    docker rm adeeti-container || true
                    docker run -d --name adeeti-container -p 80:80 adeeti-jwellers
                '''
            }
        }
    }
}
