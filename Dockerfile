FROM jenkins/jenkins:lts
USER root

# # Install Docker CLI
# ENV DOCKER_VERSION=25.0.3
# RUN curl -sfL -o docker.tgz "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" && \
#   tar -xzf docker.tgz docker/docker --strip=1 --directory /usr/local/bin && \
#   rm docker.tgz

RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update  -qq \
    && apt-get -y install docker-ce
RUN groupadd -f docker && usermod -aG docker jenkins