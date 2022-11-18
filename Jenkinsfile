pipeline {
    agent any

    stages {
        stage ('(1) Git clone') {
            steps {
                git branch: 'main', url: 'https://github.com/shay79il/UseOfJenkinsfile1/'
            }
        }
        stage ('(2) Build image') {
            steps {
                // sh 'docker build -t shay79il/sample-app .'
                sh 'docker-compose up --build'
            }
        }
    }

    post {
        success {
            echo "======= SUCCESS =======\n======= SUCCESS =======\n======= SUCCESS =======\n"
            echo "BUILD_URL ${env.BUILD_URL}"

            // stage ('(1) Push image to dockerHub')
            sh 'docker push shay79il/sample-app'
            
        }
        
        failure {
            echo "======= FAIL !!! =======\n======= FAIL !!! =======\n======= FAIL !!! =======\n"
            echo "BUILD_URL ${env.BUILD_URL}"
            echo "======= Build docker image \nshay79il/sample-app FAILED!!! =======\n"
        }
    }
}