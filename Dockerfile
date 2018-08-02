FROM openjdk:latest

RUN apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_9.x | bash - \
  && apt-get install -y nodejs \
  && curl -L https://www.npmjs.com/install.sh | sh \
  && export PATH="$PATH:/usr/lib/node_modules/npm/bin" \
  && export DETECT_LATEST_RELEASE_VERSION=4.1.0

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
# COPY . .

EXPOSE 8080
#CMD ["npm", "start"]

#RUN curl -O https://artifactory.core.rcsops.com/artifactory/hub-detect/hub-detect-virtustream.sh \
#&& chmod +x hub-detect-virtustream.sh \
#&& ./hub-detect-virtustream.sh --blackduck.hub.url='https://bduck01.core.rcsops.com' --blackduck.hub.api.token=N2E2MDkyODktNGZlNi00ZmNiLThhNDUtM2I5M2NmNjhiNTkwOmE3ZTBlYzAwLTRjOWEtNDhlNS1hNDkxLWE1ZjcwOWE3YzU1NA== --detect.project.version.name=2.0 --detect.project.name=Acme --blackduck.hub.proxy.host=10.131.146.14 --blackduck.hub.proxy.port=3128 --detect.code.location.name="jenkins_acme-2.0" --detect.project.codelocation.delete.old.names=true
