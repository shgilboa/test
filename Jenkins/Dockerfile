FROM jenkins/jenkins:latest
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false -Dhttp.proxyPort=3128 -Dhttp.proxyHost=10.67.37.157 -Dhttps.proxyPort=3128 -Dhttps.proxyHost=10.67.37.157

# Install plugins includin JCasC
COPY jenkins-plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Set JCasC configuration
COPY configuration.yaml /var/jenkins_home/configuration.yaml
ENV CASC_JENKINS_CONFIG /var/jenkins_home/configuration.yaml
