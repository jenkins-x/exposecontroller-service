pipeline {
   agent any
   environment {
      CHARTMUSEUM_CREDS = credentials('jenkins-x-chartmuseum')
   }
   stages {
      stage('Release') {
         steps {
            sh "echo using jenkins-x-chartmuseum credentials"
            sh "helm init --client-only"
            sh "make release"
         }
      }
   }
}