pipeline {
   agent {
      label "jenkins-go"
   }
   stages {
      stage('Release') {
         container('go') {
            sh "make release"
         }
      }
   }
}