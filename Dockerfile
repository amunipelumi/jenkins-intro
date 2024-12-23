# FROM jenkins/jenkins:2.479.1-jdk17
# USER root
# RUN apt-get update && apt-get install -y lsb-release
# RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
#   https://download.docker.com/linux/debian/gpg
# RUN echo "deb [arch=$(dpkg --print-architecture) \
#   signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
#   https://download.docker.com/linux/debian \
#   $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
# RUN apt-get update && apt-get install -y docker-ce-cli
# USER jenkins
# RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"

# ------------------------------------------------------------------------------ #

# How to extend jenkins agent
FROM jenkins/inbound-agent:latest
USER root
RUN apt-get update && apt-get install -y \
    sudo python3 python3-pip \
    python3-venv && \
    apt-get clean
USER jenkins
RUN java --version && python3 --version
