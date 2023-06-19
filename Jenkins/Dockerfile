FROM jenkins/jenkins:lts-jdk11
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install plugins includin JCasC
COPY jenkins-plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Set JCasC configuration
COPY configuration.yaml /var/jenkins_home/configuration.yaml
ENV CASC_JENKINS_CONFIG /var/jenkins_home/configuration.yaml