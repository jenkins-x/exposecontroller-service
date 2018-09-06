pipeline {
   agent {
      label "jenkins-go"
   }
   stages {
      stage('Release') {
         steps {
            container('go') {
               sh "make release"
            }
         }
      }
   }
}