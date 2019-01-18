node ('docker2'){

def myImage = docker.image("acme-dev-local.dkr.core.rcsops.com/jdk/bduck")
    stage ('Clean Working Directory') {
        deleteDir()
    }
    
    stage ('Checkout SCM') {
        checkout scm        
    }
    
    stage ('Build Image') {
        sh 'echo ${WORKSPACE}'
        //docker.build("acme:test")
    }   
        
    stage ('Black Duck Scan') {
        myImage.inside {
         sh """
         mkdir signature_scanner
         curl -O https://artifactory.core.rcsops.com/artifactory/hub-detect/hub-detect-virtustream.sh
         export DETECT_LATEST_RELEASE_VERSION=5.0.1
         chmod +x hub-detect-virtustream.sh 
         ./hub-detect-virtustream.sh \
--blackduck.url='https://bduck01.core.rcsops.com' \
--blackduck.proxy.host=10.131.146.14 \
--blackduck.proxy.port=3128 \
--blackduck.api.token=N2E2MDkyODktNGZlNi00ZmNiLThhNDUtM2I5M2NmNjhiNTkwOmE3ZTBlYzAwLTRjOWEtNDhlNS1hNDkxLWE1ZjcwOWE3YzU1NA== \
--detect.project.version.name=3.0 \
--detect.project.name=Acme \
--detect.code.location.name="jenkins_acme-3.0" \
--detect.project.codelocation.delete.old.names=true \
--blackduck.signature.scanner.local.path=/signature_scanner \
--detect.blackduck.signature.scanner.exclusion.patterns=/signature_scanner/
         """    
        }   
     }
   
}
