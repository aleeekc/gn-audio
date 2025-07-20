pipeline {
        agent { 
           docker {
               image stm32-docker
               reuseNode true
           }
        }

        options {
            timestamps()
            skipDefaultCheckout()
        }

        environment {
		# TODO: Add env variables
        }

        stages {
            stage ('Setup') {
                steps {
                    cleanWs()
                }
            }
	    
            stage ('Checkout') {
                steps {
                    checkout(scm)
                    
                }
            }

            stage ('Run cmake') {
                steps {
                    # TODO: Set the version
                    # TODO: Run in parallel for different targets
                    bat(
                       label: "Run cmake",
                       script:"cmake -DCMAKE_TOOLCHAIN_FILE=toolchain.cmake"
                    )
                    
                }
            }

            stage ('Run make') {
                steps {
                    bat(
                       label: "Run make",
                       script:"make -j 32"

                       stash includes: '*.hex, *.elf, *.bin', name: 'Firmware'
                    )
                    
                }
            }

            stage ('Run unittest') {
                steps {
                    bat(
                       label: "Run unit tests",
                       script: "......"
                    )
                    
                }
            }

	    stage ('Run unittest on real hardware') {
                node('hardware') {
                steps {
                    unstash 'Firmware'
                    bat(
                       label: "Run unit tests",
                       script: "......"
                    )
                    
                }
            }

            stage ('Sign firmware') {
                steps {
                    bat(
                       label: "Sign firmware",
                       script: "......"
                    )
                    
                }
            }

            stage ('Zip and upload artifacts') {
                steps {
                    zip FileName: "Firmware-${env.VERSION}.zip", include: "*.elf, *.bin, *.hex"
                    # TODO: Upload to Artifactory and somewhere else
                }
            }
       }
    post {
        failure {
            emailext body: '${SCRIPT, template="os-main-html"}',
                    mimeType: 'text/html',
                    presendScript: 'msg.setSubject(msg.getSubject().replace(\'origin/\', \'\'))',
                    recipientProviders: [
                            [$class: 'DevelopersRecipientProvider'],
                            [$class: 'CulpritsRecipientProvider'],
                            [$class: 'RequesterRecipientProvider']
                    ],
                    subject: "${BRANCH_NAME}: build failed",
                    to: 'bcc:noreply@example.com'
        }
        unstable {
            emailext body: '${SCRIPT, template="os-main-html"}',
                    mimeType: 'text/html',
                    presendScript: 'msg.setSubject(msg.getSubject().replace(\'origin/\', \'\'))',
                    recipientProviders: [
                            [$class: 'DevelopersRecipientProvider'],
                            [$class: 'CulpritsRecipientProvider'],
                            [$class: 'RequesterRecipientProvider']
                    ],
                    subject: "${BRANCH_NAME}: build failed",
                    to: 'bcc:noreply@example.com'
        }
        always {
            updateBuildStatus()
            logstashSend failBuild: false, maxLines: 1000
        }
    }
}