node {
    def nginx

    docker.withRegistry('', 'dockerwc') {

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

    nginx = docker.build("warecorpdev/nginx:1.15-${env.BUILD_ID}", ".")
    slackSend botUser: true, channel: 'https://warecorp.slack.com/services/hooks/jenkins-ci/', message: 'Alpine build started', tokenCredentialId: 'jenkins-token'

    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from nginx
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('', 'dockerwc') {
            nginx.push()
            nginx.push("latest")
        }
    }
  }
}