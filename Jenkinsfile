node ('docker2'){

def myImage = docker.image("acme-dev-local.dkr.core.rcsops.com/jdk/bduck")
    
    stage ('Checkout SCM') {
        checkout scm        
    }
    
    stage ('Build Image') {
        sh 'echo ${WORKSPACE}'
    }   
        
    stage ('Black Duck Scan') {
        docker.image("acme:test").inside {
         sh """
         curl -O https://artifactory.core.rcsops.com/artifactory/hub-detect/hub-detect-virtustream.sh
         export DETECT_LATEST_RELEASE_VERSION=5.0.1
         chmod +x hub-detect-virtustream.sh 
         ./hub-detect-virtustream.sh \
--blackduck.url='https://bduck01.core.rcsops.com' \
--blackduck.proxy.host=10.131.146.14 \
--blackduck.proxy.port=3128 \
--blackduck.api.token=N2E2MDkyODktNGZlNi00ZmNiLThhNDUtM2I5M2NmNjhiNTkwOmE3ZTBlYzAwLTRjOWEtNDhlNS1hNDkxLWE1ZjcwOWE3YzU1NA== \
--detect.project.version.name=2.0 \
--detect.project.name=Acme \
--detect.code.location.name="jenkins_acme-2.0" \
--detect.project.codelocation.delete.old.names=true \
--detect.source.path=/usr/src/app 
         """    
        }   
     }
   
}
