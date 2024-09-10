pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'

                script {
                    sh '''
                    buildah-version
                    '''
                }
            }
        }
    }
}
