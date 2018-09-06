pipeline {
   agent {
      label "jenkins-go"
   }
   stages {
      stage('Release') {
         steps {
            container('go') {
               sh "helm init --client-only"
               sh "make release"
            }
         }
      }
   }
}