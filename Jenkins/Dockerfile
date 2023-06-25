FROM jenkins/jenkins:latest
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false -Dhudson.slaves.WorkspaceList=- -Dhttp.proxyPort=3128 -Dhttp.proxyHost=10.67.37.157 -Dhttps.proxyPort=3128 -Dhttps.proxyHost=10.67.37.157

USER root

# Install base packages
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends \
    curl jq zip unzip wget maven


USER jenkins
RUN mkdir /var/jenkins_home/temp

# Install plugins includin JCasC
COPY jenkins-plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Set JCasC configuration
COPY configuration.yaml /var/jenkins_home/configuration.yaml
ENV CASC_JENKINS_CONFIG /var/jenkins_home/configuration.yaml


