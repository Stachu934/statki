FROM jenkins/jenkins:lts

USER root

# Zainstaluj Dockera (do używania docker CLI z poziomu Jenkinsa)
RUN apt-get update && apt-get install -y docker.io

# Instalacja wtyczek przez CLI
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
