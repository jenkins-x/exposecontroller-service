pipeline {
   agent {
      label "jenkins-go"
   }
   environment {
      CHARTMUSEUM_CREDS = credentials('jenkins-x-chartmuseum')
   }
   stages {
      stage('Release') {
         steps {
            container('go') {
               sh "using jenkins-x-chartmuseum credentials!"
               sh "helm init --client-only"
               sh "make release"
            }
         }
      }
   }
}